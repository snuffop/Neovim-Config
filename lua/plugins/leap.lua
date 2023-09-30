-- leap
local installed, Leap = pcall(require, "leap")
if not installed then
    vim.notify("Plugin 'Leap' is not installed")
    return
end

Leap.add_default_mappings()
