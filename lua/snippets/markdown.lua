local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

local function current_time()
    return os.date("%H:%M")
end

local function current_date()
    return os.date("%Y-%m-%d")
end

local function full_date()
    return os.date("%A %B %d, %Y")
end

return {
    s("ttime", f(current_time, {})),
    s("ddate", f(current_date, {})),
    s("fulldate", f(full_date, {})),
    s({ trig = ";due", wordTrig = true }, { t("📅 "), f(current_date, {}) }),
    s({ trig = ";sch", wordTrig = true }, { t("⏳ "), f(current_date, {}) }),
    s({ trig = ";done", wordTrig = true }, { t("✅ "), f(current_date, {}) }),
    s({ trig = ";prio", wordTrig = true }, { t("🔼") }),
}
