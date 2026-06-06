-- Get file paths from environment variables or use defaults
local STATIC_FILE = os.getenv("PDNS_STATIC_FILE") or "/etc/powerdns/scripts/static.txt"
local BLOCKED_FILE = os.getenv("PDNS_BLOCKED_FILE") or "/etc/powerdns/scripts/blocked.txt"

-- Data tables
local static_records = {}
local blocked_domains = {}

-- Strict domain validator and loader
local function read_file(filepath, target_table, is_static)
    local f = io.open(filepath, "r")
    if not f then
        pdnslog("ERROR: Could not open file: " .. filepath, pdns.loglevels.Error)
        return
    end

    for line in f:lines() do
        -- Remove trailing spaces, tabs, and Windows line endings (\r)
        line = line:match("^%s*(.-)%s*$")

        if line and line ~= "" then
            -- Skip comments or URLs that might accidentally be in the file
            if not line:find("^#") and not line:find("^http") then
                local raw_domain = line:lower()

                if is_static then
                    local domain, ip = raw_domain:match("^([%w%.%-%_]+)%s+(%d+%.%d+%.%d+%.%d+)$")
                    if domain and ip then
                        target_table[domain .. "."] = ip
                    end
                else
                    -- Extract pure domain name to prevent parsing file paths or garbage
                    local domain_match = raw_domain:match("^([%w%.%-_]+)$")
                    if domain_match then
                        -- PowerDNS queries always end with a dot, so we map it directly
                        target_table[domain_match .. "."] = true
                    end
                end
            end
        end
    end
    f:close()
end

-- Load datasets on initialization
read_file(STATIC_FILE, static_records, true)
read_file(BLOCKED_FILE, blocked_domains, false)

-- Count what actually got into the clean table
local static_count = 0
for _ in pairs(static_records) do static_count = static_count + 1 end
local blocked_count = 0
for _ in pairs(blocked_domains) do blocked_count = blocked_count + 1 end

pdnslog("--- LUA INIT: Successfully loaded " .. static_count .. " static records and " .. blocked_count .. " VALID blocked domains ---", pdns.loglevels.Warning)

-- Query interception hook
function preresolve(dq)
    local qname = dq.qname:toString():lower()

    -- 1. Check exact match in blocklist
    if blocked_domains[qname] then
        pdnslog("LUA BLOCK EXECUTION: " .. qname, pdns.loglevels.Warning)
        dq.rcode = pdns.NXDOMAIN
        return true -- Blocked immediately
    end

    -- 2. Check exact match in static overrides
    if static_records[qname] then
        local ip = static_records[qname]
        dq:addAnswer(pdns.A, ip)
        dq.rcode = pdns.NOERROR
        return true
    end

    return false
end
