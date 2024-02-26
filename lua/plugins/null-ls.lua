-- requring plugin
local installed, null_ls = pcall(require, "null-ls")
if not installed then
    vim.notify("Plugin 'null-ls' is not installed")
    return
end

-- Setting up null_ls
local formatting = null_ls.builtins.formatting
local sources = {
    formatting.stylua,
    formatting.prettier,
    formatting.black,
    formatting.isort,
}

null_ls.setup({
    sources = sources,
})
