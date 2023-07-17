-- LSP Zero

local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = " ",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = " ",
    Misc = " ",
}


return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        config = function()
            require('lsp-zero.settings').preset({})
        end
    },

    -- Luasnip

    {
        'L3MON4D3/LuaSnip',
        requires = {"rafamadriz/friendly-snippets" , event = "InsertEnter" },
        config = function()
            local ls = require "luasnip"
            ls.config.set_config {
                history = true,
                updateevents = "TextChanged,TextChangedI",
            }
            require("luasnip.loaders.from_vscode").lazy_load{}
        end,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},
            {'onsails/lspkind.nvim'},
        },
        config = function()
            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()

            require('luasnip.loaders.from_vscode').lazy_load()
            require('lsp-zero.cmp').extend()

            cmp.setup({
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                window = {
                    documentation = {
                        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                        max_height = 25,
                        max_width = 60,
                    }
                },
                mapping = {
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ['<CR>'] = cmp.mapping.confirm({select = false}),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = 'path' },
                    { name = 'neorg' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip', keyword_length = 2 },
                    { name = 'buffer', keyword_length = 3 },
                    { name = 'nvim_lua' },
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        -- Kind icons
                        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            neorg = "[Neorg]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },

            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = {
            'LspInfo',
            'Mason',
            'MasonUpdate',
        },
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'williamboman/mason.nvim' },
        },
        config = function()
            local lsp = require('lsp-zero')
            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
            end)
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
            lsp.preset("recomended")
            lsp.nvim_workspace()
            lsp.set_preferences({
                suggest_lsp_servers = false,
                sign_icons = {
                    error = 'E',
                    warn = 'W',
                    hint = 'H',
                    info = 'I'
                }
            })
            lsp.setup()
        end
    }
}
