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
    --                        Disable Bufferline                        --
    ----------------------------------------------------------------------

    {
        "akinsho/bufferline.nvim",
        enabled = false,
    },
    ----------------------------------------------------------------------
    --                        Disable Tokyonight                        --
    ----------------------------------------------------------------------

    {
        "folke/tokyonight.nvim",
        enable = false,
        opts = { 
            style = "night",
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
            colorscheme = "catppuccin",
            news = {
                neovim = true,
            }
        }
    },

    ----------------------------------------------------------------------
    --                  Enable more of Folke's snacks                   --
    ----------------------------------------------------------------------

    {
        'snacks.nvim',
        opts = {
            bigfile = { enabled = true },
            quickfile = { enabled = true },
        },
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

    ----------------------------------------------------------------------
    --                       Vim-Tridactyl syntax                       --
    ----------------------------------------------------------------------
    {
        "tridactyl/vim-tridactyl",
        lazy = false,
    },
}

