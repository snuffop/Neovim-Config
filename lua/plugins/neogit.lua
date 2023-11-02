-- Neogit
local installed, NeoGit = pcall(require, 'neogit')
if not installed then
    vim.notify("Plugin 'NeoGit' is not installed")
    return
end

NeoGit.setup {
    integrations = {
        diffview = true,
        telescope = true,
        fzf_lua = true,
    },
}
