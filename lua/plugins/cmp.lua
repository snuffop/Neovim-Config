-- ###################################################################################################
-- requring necessary plugins
-- nvim-cmp
local installed, Cmp = pcall(require, "cmp")
if not installed then
    vim.notify("Plugin 'nvim-cmp' is not installed")
    return
end

-- luasnip
local installed, LuaSnip = pcall(require, "luasnip")
if not installed then
    vim.notify("Plugin 'luasnip' is not installed")
    return
end

-- lspkind
local installed, LspKind = pcall(require, "lspkind")
if not installed then
    vim.notify("Plugin 'lspkind' is not installed")
    return
end

-- luasnip.loaders.from_vscode
local installed, VScodeSnippets = pcall(require, "luasnip.loaders.from_vscode")
if not installed then
    vim.notify("Plugin 'luasnip_vscode' is not installed")
    return
end

local installed, SnipMateSnippets = pcall(require, "luasnip.loaders.from_snipmate")
if not installed then
    vim.notify("Plugin 'luasnip_snipmate' is not installed")
    return
end

local installed, LuaSnippets = pcall(require, "luasnip.loaders.from_lua")
if not installed then
    vim.notify("Plugin 'luasnip_lua' is not installed")
    return
end

local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

-- ###################################################################################################
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- ###################################################################################################

local types = require "luasnip.util.types"

LuaSnip.setup({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " « ", "NonTest" } },
            },
        },
    },
})

-- Luasnip keymap
vim.keymap.set({ "i", "s" }, "<c-s>", function ()
    if LuaSnip.expand_or_jumpable() then
        LuaSnip.expand_or_jump()
    end
end,{ silent = true })

vim.keymap.set({ "i", "s" }, "<c-S>", function ()
    if LuaSnip.jumpable(-1) then
        LuaSnip.jump(-1)
    end
end, {silent = true })

-- vim.keymap.set( "i", "<c-l>", function ()
--     if LuaSnip.choice_active() then
--         LuaSnip.change_choice(1)
--     end
-- end)

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/cmp.lua<CR>")

-- Set up nvim-cmp.
Cmp.setup({
    preselect = "item",
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            LuaSnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    window = {
        completion = Cmp.config.window.bordered(),
        documentation = Cmp.config.window.bordered(),
    },

    mapping = Cmp.mapping.preset.insert({
        ["<C-p>"] = Cmp.mapping.select_prev_item(),
        ["<C-n>"] = Cmp.mapping.select_next_item(),
        ["<A-u>"] = Cmp.mapping.confirm({ select = true }),
        ["<C-b>"] = Cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = Cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = Cmp.mapping.complete(),
        ["<C-e>"] = Cmp.mapping.abort(),
        ["<CR>"] = Cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }), -- end of mapping section

    -- Managing Sources for completions
    sources = Cmp.config.sources({
        { name = "luasnip" }, -- For luasnip users.
        { name = "neorg" },
        { name = "nvim_lsp", max_item_count = 6 },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "buffer", max_item_count = 6 },
    }),

    formatting = {
        fields = { "kind", "abbr", "menu" },
        -- format = LspKind.cmp_format({ with_text = true, maxwidth = 50 }),
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                luasnip = "LuaSnip",
                nvim_lua = "[NVim Lua]",
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
})

-- Set configuration for specific filetype.
Cmp.setup.filetype("gitcommit", {
    sources = Cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
            { name = "buffer" },
    }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
Cmp.setup.cmdline({ "/", "?" }, {
    mapping = Cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
Cmp.setup.cmdline(":", {
    mapping = Cmp.mapping.preset.cmdline(),
    sources = Cmp.config.sources({
        { name = "path" },
        }, {
            { name = "cmdline" },
    }),
})

-- for vscode like snippets
VScodeSnippets.lazy_load()
SnipMateSnippets.lazy_load()
-- LuaSnippets.lazy_load({ paths = { "~/.config/nvim/snippets/" } })
LuaSnip.snippets = {
    all = {
        LuaSnip.parser.parse_snippet("expand", "-- this is what was expanded!"),
    },
}

