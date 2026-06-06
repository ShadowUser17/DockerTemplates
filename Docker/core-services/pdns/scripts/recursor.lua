-- Paths
local STATIC_FILE = os.getenv("PDNS_STATIC_FILE") or "/etc/powerdns/scripts/static.txt"
local BLOCKED_FILE = os.getenv("PDNS_BLOCKED_FILE") or "/etc/powerdns/scripts/blocked.txt"

-- State
local static_records = {}
local blocked_domains = {}

local function normalize(name)
    return tostring(name):gsub("%.$", ""):lower()
end

local function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

-- Load data from files
local function load_data()
    static_records = {}
    blocked_domains = {}

    -- BLOCKLIST
    local f = io.open(BLOCKED_FILE, "r")
    if f then
        for line in f:lines() do
            line = trim(line)

            if line ~= "" and not line:match("^#") then
                blocked_domains[normalize(line)] = true
            end
        end
        f:close()
    else
        pdnslog("Cannot open blocked file: " .. BLOCKED_FILE, pdns.loglevels.Warning)
    end

    -- STATIC RECORDS
    local fs = io.open(STATIC_FILE, "r")
    if fs then
        for line in fs:lines() do
            line = trim(line)

            if line ~= "" and not line:match("^#") then
                local domain, qtype, value = line:match("([^,]+),([^,]+),(.+)")

                if domain and qtype and value then
                    domain = normalize(domain)
                    qtype = trim(qtype):upper()
                    value = trim(value)

                    static_records[domain] = {
                        type = qtype,
                        value = value
                    }
                end
            end
        end
        fs:close()
    else
        pdnslog("Cannot open static file: " .. STATIC_FILE, pdns.loglevels.Warning)
    end

    pdnslog(
        "Lua loaded: " ..
        tostring(#blocked_domains) .. " blocked entries, " ..
        tostring(#static_records) .. " static records",
        pdns.loglevels.Warning
    )
end

-- LOAD ON SCRIPT START (IMPORTANT: no init() in Recursor Lua)
load_data()

-- MAIN DNS HOOK
function preresolve(dq)
    local qname = normalize(dq.qname)

    -- 1. BLOCK
    if blocked_domains[qname] then
        pdnslog("BLOCKED: " .. qname, pdns.loglevels.Warning)
        dq.rcode = pdns.NXDOMAIN
        return true
    end

    -- 2. STATIC ANSWERS
    local record = static_records[qname]

    if record then
        if record.type == "A" and dq.qtype == pdns.A then
            dq:addAnswer(pdns.A, record.value, 300)
            return true
        end

        if record.type == "CNAME" and dq.qtype == pdns.CNAME then
            dq:addAnswer(pdns.CNAME, record.value, 300)
            return true
        end

        if record.type == "AAAA" and dq.qtype == pdns.AAAA then
            dq:addAnswer(pdns.AAAA, record.value, 300)
            return true
        end
    end

    return false
end
