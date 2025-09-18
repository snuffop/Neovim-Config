--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯


----------------------------------------------------------------------
--                  Tweak settings for mini files                   --
----------------------------------------------------------------------
return {
    {
        "nvim-mini/mini.files",
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
        "nvim-mini/mini.surround",
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
    },

    {
        "nvim-mini/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = { insert = true, command = true, terminal = false },
            skip_next = [=[[%w%%%'%[%"%.%`%$%]]]=],
            skip_ts = { "string" },
            skip_unbalanced = true,
            markdown = true,
            mappings = { ["`"] = false },
            rules = {},
        },
        config = function(_, opts)
            LazyVim.mini.pairs(opts)
            -- nuke pairs in markdown buffers (keeps pairs elsewhere)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function() vim.b.minipairs_disable = true end,
            })
        end,
    },
    {
        "nvim-mini/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = "LazyFile",
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
}

