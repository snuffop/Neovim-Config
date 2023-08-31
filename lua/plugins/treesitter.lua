-- Tree Sitter
return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = {':TSUPdate'},
        opts = {
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            ensure_installed = {
                "bash",
                "c",
                "comment",
                "css",
                "html",
                "http",
                "java",
                "javascript",
                "jq",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "ruby",
                "rust",
                "sql",
                "todotxt",
                "tsx",
                "typescript",
                "yaml",
                'Javascript',
                'json',
                'norg',
                'terraform',
                'vim',
                'yaml',
            },
            ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true,
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = 1000,
            },
            highlight = {
                enable = true, -- false will disable the whole extension
                additional_vim_regex_highlighting = { "markdown" },
            },
            tree_docs = {
                enable = true,
            },
            autopairs = {
                enable = true,
            },
            autotag = {
                enable = true,
            }
        }
    },

    {
        'nvim-treesitter/nvim-treesitter-context',
        lazy = false,
        opts = {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true,
            multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
            trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
            zindex = 20, -- The Z-index of the context window
            on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        }
    }
}
