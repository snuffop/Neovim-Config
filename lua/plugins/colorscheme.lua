--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {
    {
        "folke/tokyonight.nvim",
        enabled = true,
        priority = 1000,
        opts = {
            style = "night",
            transparent = true,
            on_highlights = function(hl, c)
                hl.LineNr       = { fg = c.fg_dark }       -- softer than c.fg
                hl.LineNrAbove  = { fg = c.fg_dark }
                hl.LineNrBelow  = { fg = c.fg_dark }
                hl.CursorLineNr = { fg = c.yellow, bold = true }
            end,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")

            vim.opt.number = true
            vim.opt.relativenumber = true
            vim.opt.signcolumn = "yes:1"
        end,
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
            news = {
                neovim = true,
            }
        }
    },
}
