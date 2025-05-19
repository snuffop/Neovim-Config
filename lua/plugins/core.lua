--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

----------------------------------------------------------------------
--                               Misc                               --
--              Misc plugins and overrides of lazyvim               --
--                      preconfigured settings                      --
--        Overrides need only have the chanes added, as they        --
--          override existing or set non existing configs           --
----------------------------------------------------------------------


return {
    ----------------------------------------------------------------------
    --                        Disable Tokyonight                        --
    ----------------------------------------------------------------------

    {
        "folke/tokyonight.nvim",
        enable = true,
        opts = { 
            style = "moon",
            transparent = true,
        },
    },

    ----------------------------------------------------------------------
    --                        Enable Catppuccin                         --
    ----------------------------------------------------------------------

    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_backgroud = true,
            flavour = "mocha",
            integration = {
                copilot = true,
                blink = true,
            }
        }
    },

    ----------------------------------------------------------------------
    --              Set Catppuccin as the used colorscheme              --
    ----------------------------------------------------------------------

    {
        "LazyVim/LazyVim",
        opts = {
            --colorscheme = "tokyonight",
            colorscheme = "catppuccin",
            news = {
                neovim = true,
            }
        }
    },

    ----------------------------------------------------------------------
    --                  Tweak settings for mini files                   --
    ----------------------------------------------------------------------

    {
        "echasnovski/mini.files",
        opts = {
            windows = {
                width_preview = 90 
            },
            options = {
                use_as_default_explorer = true
            }
        }
    },

}

