--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- ~/.config/nvim/lua/plugins/luasnip.lua

return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    region_check_events = "CursorHold,InsertLeave",
    delete_check_events = "TextChanged,InsertLeave",
  },
  config = function(_, opts)
    local ls = require("luasnip")
    ls.config.set_config(opts)
    pcall(function() require("luasnip.loaders.from_vscode").lazy_load() end)
    local local_paths = {
      vim.fn.stdpath("config") .. "/lua/snippets",
    }
    require("luasnip.loaders.from_lua").lazy_load({ paths = local_paths })
  end,
}
