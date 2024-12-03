--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {

    {
        "folke/tokyonight.nvim",
        enable = true,
        opts = { style = "night" },
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },

    {
        "folke/snacks.nvim",
        lazy = false,
        opts = {
            statuscolumn = {
                enabled = true,
            },
        },
    },

}
