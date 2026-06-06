local STATIC_FILE = os.getenv("PDNS_STATIC_FILE") or "/etc/powerdns/scripts/static.txt"
local BLOCKED_FILE = os.getenv("PDNS_BLOCKED_FILE") or "/etc/powerdns/scripts/blocked.txt"

local static_records = {}
local blocked_domains = {}

local last_static_mtime = 0
local last_blocked_mtime = 0
local initialized = false

local function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function normalize(q)
    return tostring(q):gsub("%.$", ""):lower()
end

local function file_mtime(path)
    local f = io.popen("stat -c %Y " .. path .. " 2>/dev/null")
    if not f then return 0 end
    local out = f:read("*a")
    f:close()
    return tonumber(out) or 0
end

local function load_data(force_log)
    local sm = file_mtime(STATIC_FILE)
    local bm = file_mtime(BLOCKED_FILE)

    if sm == last_static_mtime and bm == last_blocked_mtime then
        return
    end

    static_records = {}
    blocked_domains = {}

    local fb = io.open(BLOCKED_FILE, "r")
    if fb then
        for line in fb:lines() do
            line = trim(line)
            if line ~= "" and not line:match("^#") then
                blocked_domains[normalize(line)] = true
            end
        end
        fb:close()
    end

    local fs = io.open(STATIC_FILE, "r")
    if fs then
        for line in fs:lines() do
            line = trim(line)
            if line ~= "" and not line:match("^#") then
                local d, t, v = line:match("([^,]+),([^,]+),(.+)")
                if d then
                    static_records[normalize(d)] = {
                        type = trim(t):upper(),
                        value = trim(v)
                    }
                end
            end
        end
        fs:close()
    end

    last_static_mtime = sm
    last_blocked_mtime = bm

    if not initialized or force_log then
        pdnslog(
            "Lua initialized: blocked=" .. tostring((function()
                local c = 0
                for _ in pairs(blocked_domains) do c = c + 1 end
                return c
            end)()) ..
            " static=" .. tostring((function()
                local c = 0
                for _ in pairs(static_records) do c = c + 1 end
                return c
            end)()),
            pdns.loglevels.Warning
        )
        initialized = true
    end
end

-- initial load ONLY
load_data(true)

function preresolve(dq)

    local qname = normalize(dq.qname)

    local sm = file_mtime(STATIC_FILE)
    local bm = file_mtime(BLOCKED_FILE)

    if sm ~= last_static_mtime or bm ~= last_blocked_mtime then
        load_data(false)
    end

    for blocked in pairs(blocked_domains) do
        if qname == blocked or qname:sub(-#blocked-1) == "." .. blocked then
            pdnslog("BLOCKED: " .. qname, pdns.loglevels.Warning)
            dq.rcode = pdns.NXDOMAIN
            return true
        end
    end

    local rec = static_records[qname]
    if rec then
        if dq.qtype == pdns.A and rec.type == "A" then
            dq:addAnswer(pdns.A, rec.value, 300)
            return true
        end
        if dq.qtype == pdns.CNAME and rec.type == "CNAME" then
            dq:addAnswer(pdns.CNAME, rec.value, 300)
            return true
        end
    end

    return false
end
