return {

  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'f3fora/cmp-spell',
  },

  config = function ()
    -- nvim-cmp setup
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    local check_backspace = function()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
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

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },

      -- formatting = {
      --   fields = { "kind", "abbr", "menu" },
      --   format = function(entry, vim_item)
      --     -- Kind icons
      --     vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      --     -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      --     vim_item.menu = ({
      --       nvim_lsp = "[LSP]",
      --       luasnip = "[Snippet]",
      --       buffer = "[Buffer]",
      --       path = "[Path]",
      --       spell = "[Spell]",
      --     })[entry.source.name]
      --     return vim_item
      --   end,
      -- },

      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'spell',
          options = {
            keep_all_entries = false,
            enable_in_context = function()
              return true
            end,
          },
        },
        {name = 'buffer'},
      },
    }

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
          { name = 'buffer' },
        })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
          { name = 'cmdline' }
        })
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp

    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    end
    -- Setup lspconfig.
    local nvim_lsp = require('lspconfig')

    -- setup languages 
    -- GoLang
    nvim_lsp['gopls'].setup{
      cmd = {'gopls'},
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        gopls = {
          experimentalPostfixCompletions = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
      init_options = {
        usePlaceholders = true,
      }
}
  end
}
