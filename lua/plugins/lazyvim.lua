--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {

    {
        "folke/tokyonight.nvim",
        enable = true,
        opts = { 
            style = "night",
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },

    {
        'snacks.nvim',
        opts = {
            bigfile = { enabled = true },
            quickfile = { enabled = true },
        },
    },
}


