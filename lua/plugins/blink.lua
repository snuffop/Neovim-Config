--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- BLINK Obsidian  Config
return {

    "saghen/blink.cmp",
    dependencies = { 
        "epwalsh/obsidian.nvim",
        "saghen/blink.compat",
        "mikavilpas/blink-ripgrep.nvim",
    },
    opts = {
        sources = {
            compat = { "obsidian", "obsidian_new", "obsidian_tags" },
            default = {
                "ripgrep",
            },

            providers = {
                ripgrep = {
                    module = "blink-ripgrep",
                    name = "Ripgrep",
                    -- the options below are optional, some default values are shown
                    ---@module "blink-ripgrep"
                    ---@type blink-ripgrep.Options
                    opts = {
                        -- For many options, see `rg --help` for an exact description of
                        -- the values that ripgrep expects.

                        -- the minimum length of the current word to start searching
                        -- (if the word is shorter than this, the search will not start)
                        prefix_min_len = 3,

                        -- The number of lines to show around each match in the preview
                        -- (documentation) window. For example, 5 means to show 5 lines
                        -- before, then the match, and another 5 lines after the match.
                        context_size = 5,

                        -- The maximum file size of a file that ripgrep should include in
                        -- its search. Useful when your project contains large files that
                        -- might cause performance issues.
                        -- Examples:
                        -- "1024" (bytes by default), "200K", "1M", "1G", which will
                        -- exclude files larger than that size.
                        max_filesize = "1M",

                        -- Specifies how to find the root of the project where the ripgrep
                        -- search will start from. Accepts the same options as the marker
                        -- given to `:h vim.fs.root()` which offers many possibilities for
                        -- configuration. If none can be found, defaults to Neovim's cwd.
                        --
                        -- Examples:
                        -- - ".git" (default)
                        -- - { ".git", "package.json", ".root" }
                        project_root_marker = ".git",

                        -- The casing to use for the search in a format that ripgrep
                        -- accepts. Defaults to "--ignore-case". See `rg --help` for all the
                        -- available options ripgrep supports, but you can try
                        -- "--case-sensitive" or "--smart-case".
                        search_casing = "--ignore-case",

                        -- (advanced) Any additional options you want to give to ripgrep.
                        -- See `rg -h` for a list of all available options. Might be
                        -- helpful in adjusting performance in specific situations.
                        -- If you have an idea for a default, please open an issue!
                        --
                        -- Not everything will work (obviously).
                        additional_rg_options = {},

                        -- When a result is found for a file whose filetype does not have a
                        -- treesitter parser installed, fall back to regex based highlighting
                        -- that is bundled in Neovim.
                        fallback_to_regex_highlighting = true,

                        -- Show debug information in `:messages` that can help in
                        -- diagnosing issues with the plugin.
                        debug = false,
                    },
                    -- (optional) customize how the results are displayed. Many options
                    -- are available - make sure your lua LSP is set up so you get
                    -- autocompletion help
                    transform_items = function(_, items)
                        for _, item in ipairs(items) do
                            -- example: append a description to easily distinguish rg results
                            item.labelDetails = {
                                description = "(rg)",
                            }
                        end
                        return items
                    end,
                },
            },
        },
    },
    keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<c-g>"] = {
            function()
                -- invoke manually, requires blink >v0.8.0
                require("blink-cmp").show({ providers = { "ripgrep" } })
            end,
        },
    },
    completion = {
        list = {
            selection = "auto_insert",
        }
    },
}
