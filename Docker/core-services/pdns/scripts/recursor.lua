-- Get paths from environment variables, or use defaults
local STATIC_FILE = os.getenv("PDNS_STATIC_FILE") or "/etc/powerdns/scripts/static.txt"
local BLOCKED_FILE = os.getenv("PDNS_BLOCKED_FILE") or "/etc/powerdns/scripts/blocked.txt"

-- Data tables
local static_records = {}
local blocked_domains = {}

-- Counters for logging
local static_count = 0
local blocked_count = 0

-- Initialize: Load data from files into memory
function init()
    -- Clear existing data (important on reload)
    static_records = {}
    blocked_domains = {}
    static_count = 0
    blocked_count = 0

    -- Load blocklist
    local f_blocked = io.open(BLOCKED_FILE, "r")
    if f_blocked then
        for line in f_blocked:lines() do
            local domain = line:match("^%s*(.-)%s*$"):lower()

            if domain ~= "" and not domain:match("^#") then
                blocked_domains[domain] = true
                blocked_count = blocked_count + 1
            end
        end

        f_blocked:close()
    else
        pdnslog("Warning: Could not open " .. BLOCKED_FILE, pdns.loglevels.Warning)
    end

    -- Load static records
    local f_static = io.open(STATIC_FILE, "r")
    if f_static then
        for line in f_static:lines() do
            line = line:match("^%s*(.-)%s*$")

            -- Ignore comments and empty lines
            if line ~= "" and not line:match("^#") then
                local domain, qtype, value = line:match("([^,]+),([^,]+),(.+)")

                if domain and qtype and value then
                    domain = domain:match("^%s*(.-)%s*$"):lower()
                    qtype = qtype:match("^%s*(.-)%s*$"):upper()
                    value = value:match("^%s*(.-)%s*$")

                    static_records[domain] = {
                        type = qtype,
                        value = value
                    }

                    static_count = static_count + 1
                end
            end
        end

        f_static:close()
    else
        pdnslog("Warning: Could not open " .. STATIC_FILE, pdns.loglevels.Warning)
    end

    pdnslog(
        string.format(
            "Lua scripts initialized: %d static records and %d blocked domains loaded",
            static_count,
            blocked_count
        ),
        pdns.loglevels.Info
    )
end

function preresolve(dq)
    -- Normalize query name:
    -- remove trailing dot and convert to lowercase
    local qname = tostring(dq.qname):gsub("%.$", ""):lower()

    -- 1. Exact blocklist match
    if blocked_domains[qname] then
        pdnslog(
            "Blocked request: " .. qname .. " from " .. tostring(dq.remoteaddr),
            pdns.loglevels.Warning
        )

        dq.rcode = pdns.NXDOMAIN
        return true
    end

    -- 2. Static records
    local static = static_records[qname]

    if static then
        if static.type == "A" and dq.qtype == pdns.A then
            dq:addAnswer(pdns.A, static.value, 300)
            return true
        end

        if static.type == "CNAME" and dq.qtype == pdns.CNAME then
            dq:addAnswer(pdns.CNAME, static.value, 300)
            return true
        end
    end

    -- 3. Continue with normal recursive resolution
    return false
end
