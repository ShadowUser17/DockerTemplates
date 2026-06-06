-- Get file paths from environment variables or use defaults
local STATIC_FILE = os.getenv("PDNS_STATIC_FILE") or "/etc/powerdns/scripts/static.txt"
local BLOCKED_FILE = os.getenv("PDNS_BLOCKED_FILE") or "/etc/powerdns/scripts/blocked.txt"

-- Data tables
local static_records = {}
local blocked_domains = {}

-- Strict validator and loader
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
            if not line:find("^#") and not line:find("^http") then
                local raw_line = line:lower()

                if is_static then
                    -- Match domain and ANY target value (IP or alias domain)
                    local domain, target = raw_line:match("^([%w%.%-%_]+)%s+([%w%.%-%_]+)$")
                    if domain and target then
                        -- For CNAME targets, ensure they end with a dot as per DNS specs
                        if not target:match("%d+%.%d+%.%d+%.%d+") and target:sub(-1) ~= "." then
                            target = target .. "."
                        end
                        target_table[domain .. "."] = target
                    end
                else
                    local domain_match = raw_line:match("^([%w%.%-_]+)$")
                    if domain_match then
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

local static_count = 0
for _ in pairs(static_records) do static_count = static_count + 1 end
local blocked_count = 0
for _ in pairs(blocked_domains) do blocked_count = blocked_count + 1 end

pdnslog("--- LUA INIT: Loaded " .. static_count .. " static records and " .. blocked_count .. " blocked domains ---", pdns.loglevels.Warning)

-- Query interception hook
function preresolve(dq)
    local qname = dq.qname:toString():lower()

    -- 1. Check exact match in blocklist
    if blocked_domains[qname] then
        pdnslog("LUA BLOCK EXECUTION: " .. qname, pdns.loglevels.Warning)
        dq.rcode = pdns.NXDOMAIN
        return true
    end

    -- 2. Check exact match in static overrides (A & CNAME)
    if static_records[qname] then
        local target = static_records[qname]

        -- Check if target is an IPv4 address
        if target:match("^%d+%.%d+%.%d+%.%d+$") then
            dq:addAnswer(pdns.A, target)
        else
            -- If it's not an IP, it's a CNAME target
            dq:addAnswer(pdns.CNAME, target)
        end

        dq.rcode = pdns.NOERROR
        return true
    end

    return false
end
