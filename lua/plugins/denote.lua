local installed, Denote = pcall(require, "denote")
if not installed then
    vim.notify("Plugin 'denote' is not installed")
    return
end

Denote.setup({
    filename = {
        ext = "norg",
        date_sep = "=",
        name_sep = "-",
        tag_sep = "_",
    },
    vault = {
        dir = "~/Nextcloud/Neorg/",
    },
})
