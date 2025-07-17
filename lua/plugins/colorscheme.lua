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
        },
    },


    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_backgroud = true,
            flavour = "mocha",
            integration = {
                copilot = true,
                blink_cmp = true,
            }
        }
    },


    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
            --colorscheme = "catppuccin",
            news = {
                neovim = true,
            }
        }
    },
}
