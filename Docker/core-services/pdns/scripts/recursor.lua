-- Configuration variables
local STATIC_FILE = "/etc/powerdns/scripts/static.txt"
local BLOCKED_FILE = "/etc/powerdns/scripts/blocked.txt"

-- Data tables
local static_records = {}
local blocked_domains = {}

-- Initialize: Load data from files into memory
function init()
    -- Load blocklist
    local f_blocked = io.open(BLOCKED_FILE, "r")
    if f_blocked then
        for line in f_blocked:lines() do
            local domain = line:match("^%s*(.-)%s*$")
            if domain ~= "" and not domain:match("^#") then
                blocked_domains[domain] = true
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
            -- Ignore comments and empty lines
            if line ~= "" and not line:match("^#") then
                local domain, qtype, value = line:match("([^,]+),([^,]+),([^,]+)")
                if domain then
                    static_records[domain:match("^%s*(.-)%s*$")] = {type = qtype:match("^%s*(.-)%s*$"), value = value:match("^%s*(.-)%s*$")}
                end
            end
        end
        f_static:close()
    else
        pdnslog("Warning: Could not open " .. STATIC_FILE, pdns.loglevels.Warning)
    end

    pdnslog("Lua scripts initialized: " .. #static_records .. " static records and " .. #blocked_domains .. " blocked domains loaded.")
end

function preresolve(dq)
    -- Normalize the query name: remove the trailing dot
    local qname = tostring(dq.qname):sub(1, -2)

    -- 1. Check if domain is in the blocklist
    if blocked_domains[qname] then
        pdnslog("Blocked request: " .. qname .. " from " .. tostring(dq.remoteaddr), pdns.loglevels.Warning)
        dq.rcode = pdns.NXDOMAIN
        return true
    end

    -- 2. Check for static custom records
    local static = static_records[qname]
    if static then
        if (dq.qtype == pdns.A and static.type == "A") or (dq.qtype == pdns.CNAME and static.type == "CNAME") then
            dq:addAnswer(dq.qtype, static.value)
            return true
        end
    end

    -- 3. Continue with standard recursive resolution
    return false
end
