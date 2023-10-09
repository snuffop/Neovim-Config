local installed, gwt = pcall(require, "git-worktree")
if not installed then
    vim.notify("Plugin 'git-worktree' Not Installed")
    return
end

gwt.setup({

})
