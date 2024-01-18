local installed, Surround = pcall(require, "nvim-surround")
if not installed then
    vim.notify("Plugin 'nvim-surround' not installed ")
    return
end

Surround.setup()
