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
            style = "night",
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
                blink_cmp = true,
            }
        }
    },

    ----------------------------------------------------------------------
    --              Set Catppuccin as the used colorscheme              --
    ----------------------------------------------------------------------

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
    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = "gsa", -- Add surrounding in Normal and Visual modes
                delete = "gsd", -- Delete surrounding
                find = "gsf", -- Find surrounding (to the right)
                find_left = "gsF", -- Find surrounding (to the left)
                highlight = "gsh", -- Highlight surrounding
                replace = "gsr", -- Replace surrounding
                update_n_lines = "gsn", -- Update `n_lines`
            },
        },
    }
}

