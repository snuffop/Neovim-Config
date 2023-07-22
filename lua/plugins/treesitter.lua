-- Tree Sitter
return {
    'nvim-treesitter/nvim-treesitter',
    version = '*',
    lazy = false,
    opts = {
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
            additional_vim_regex_highlighting = false,
        },
        tree_docs = {
            enable = true,
        },
        autopairs = {
            enable = true,
        },
    }
}
