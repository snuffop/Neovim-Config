-- Hardtime
local installed, Hard = pcall(require, "hardtime")
if not installed then
    vim.notify("Plugin 'Hardtime' is not installed")
    return
end

Hard.setup({
    disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
    max_count = 10,
})
