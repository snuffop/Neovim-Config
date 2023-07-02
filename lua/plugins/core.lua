return {
    { "nvim-neo-tree/neo-tree.nvim",              enabled = false, },
    { import = "lazyvim.plugins.extras.lang.json" },

    {
        "LazyVim/LazyVim",
        version = false,
        opts = {
            colorscheme = "dracula",
        },
    },

    {
        "ThePrimeagen/harpoon",
        lazy = false,
    },

    {
        'phaazon/hop.nvim',
        lazy = false,
        branch = 'v2',
        config = function()
            require('hop').setup()
        end
    },

    {
        'AckslD/nvim-trevJ.lua',
        lazy = false,
        config = 'require("trevj").setup()',
        init = function()
            vim.keymap.set('n', '<leader>j', function()
                require('trevj').format_at_cursor()
            end)
        end,
    },

    {
        "rcarriga/nvim-notify",
        opts = {
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
        },
    },

    require("notify").setup({
        background_colour = "#282A36",
    }),

    {
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },

    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        config = true,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function()
                require("lazyvim.util").on_attach(function(_, buffer)
                    -- stylua: ignore
                    vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports",
                        { buffer = buffer, desc = "Organize Imports" })
                    vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
                end)
            end,
        },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                clangd = {},
                gopls = {},
                pyright = {},
                rust_analyzer = {},
                tsserver = {},
                ansiblels = {},
                grammarly = {},
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                tsserver = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },
    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
    { import = "lazyvim.plugins.extras.lang.typescript" },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" }
            },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "c",
                "grammarly",
                "html",
                "javascript",
                "json",
                "jq",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "marksman",
                "markdownlint",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        },
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "ansible-lint",
                "ansible-language-server",
                "yamllint",
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
            },
            function(_, opts)
                table.insert(opts.ensure_installed, "prettierd")
            end,
        },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            table.insert(opts.sources, nls.builtins.formatting.prettierd)
        end,
    },
}
