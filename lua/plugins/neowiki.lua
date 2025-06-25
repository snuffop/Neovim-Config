--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    "echaya/neowiki.nvim",
    lazy = false,
    opts = {
        wiki_dirs = {
            -- neowiki.nvim supports both absolute and relative paths
            -- { name = "Work", path = "~/work/wiki" },
            { name = "Personal", path = "~/Nextcloud/Wiki" },
        },
    },
    keys = {
        { "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
        { "<leader>wW", "<cmd>lua require('neowiki').open_wiki_floating()<cr>", desc = "Open Floating Wiki" },
        { "<leader>wT", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", desc = "Open Wiki in Tab" },
    },
}
