--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "jose-elias-alvarez/typescript.nvim",
        init = function()
            require("lazyvim.util").lsp.on_attach(function(_, buffer)
                -- stylua: ignore
                vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
                vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
            end)
        end,
    },
    ---@class PluginLspOpts
    opts = {
        ---@type lspconfig.options
        servers = {
            -- tsserver will be automatically installed with mason and loaded with lspconfig
            bashls = {},
            tsserver = {},
            pyright = {},
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },
                        codeLens = {
                            enable = true,
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                        doc = {
                            privateName = { "^_" },
                        },
                        hint = {
                            enable = true,
                            setType = false,
                            paramType = true,
                            paramName = "Disable",
                            semicolon = "Disable",
                            arrayIndex = "Disable",
                        },
                    },
                },
            },
            harper_ls = {
                enabled = true,
                filetypes = { "markdown", "text" },
                settings = {
                    ["harper-ls"] = {
                        userDictPath = "~/.config/nvim/spell/harper-dict.txt",
                        diagnosticSeverity = "hint", -- Can also be "information", "warning", or "error"
                        linters = {
                            spell_check = true,
                            spelled_numbers = false,
                            an_a = true,
                            sentence_capitalization = true,
                            unclosed_quotes = true,
                            wrong_quotes = false,
                            long_sentences = true,
                            repeated_words = true,
                            spaces = true,
                            matcher = true,
                            correct_number_suffix = true,
                            number_suffix_capitalization = true,
                            multiple_sequential_pronouns = true,
                            linking_verbs = false,
                            avoid_curses = true,
                            terminating_conjunctions = true
                        },
                        codeActions = {
                            forceStable = true,
                        },
                        isolateEnglish = true,
                        markdown = {
                            -- [ignores this part]()
                            -- [[ also ignores my marksman links ]]
                            IgnoreLinkTitle = true,
                        },
                    },
                },
            },
        },
        -- you can do any additional lsp server setup here
        -- return true if you don't want this server to be setup with lspconfig
        ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
        setup = {
            autoformat = false,
            -- example to setup with typescript.nvim
            tsserver = function(_, opts)
                require("typescript").setup({ server = opts })
                return true
            end,
        }
    }
}


