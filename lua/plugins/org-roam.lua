--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    "chipsenkbeil/org-roam.nvim",
    lazy = false,
    dependencies = {
        {
            "nvim-orgmode/orgmode",
        },
    },
    config = function()
        require("org-roam").setup({
            directory = "~/Nextcloud/Org/Roam",
            org_files = {
                "~/Nextcloud/Org/*.org",
                "~/Nextcloud/Org/Orgzly/*.org",
            },
            extensions = {
                dailies = {
                    directory = "journal",
                },
            },
            bindings = {
                prefix = "<leader>n",
            },
        })
    end
}
