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

    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     opts = {
    --         transparent_backgroud = true,
    --         flavour = "mocha",
    --         integration = {
    --             copilot = true,
    --             blink = true,
    --         }
    --     }
    -- },

    ----------------------------------------------------------------------
    --              Set Catppuccin as the used colorscheme              --
    ----------------------------------------------------------------------

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
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
            indent = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = false },
            toggle = { map = LazyVim.safe_keymap_set },
            words = { enabled = true },
            dashboard = {
                sections = {
                    { section = "header" },
                    {
                        pane = 2,
                        section = "terminal",
                        cmd = "colorscript -e square",
                        height = 5,
                        padding = 1,
                    },
                    { section = "keys", gap = 1, padding = 1 },
                    { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Git Status",
                        section = "terminal",
                        enabled = function()
                            return Snacks.git.get_root() ~= nil
                        end,
                        cmd = "git status --short --branch --renames",
                        height = 5,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                    { section = "startup" },
                },

            }
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

