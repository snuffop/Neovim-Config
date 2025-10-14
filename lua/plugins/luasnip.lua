--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- ~/.config/nvim/lua/plugins/luasnip.lua

return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" }, -- optional but handy
  opts = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    region_check_events = "CursorMoved",
    delete_check_events = "TextChanged",
  },
  config = function(_, opts)
    local ls = require("luasnip")
    ls.config.set_config(opts)

    -- VSCode-style snippets (if you install any)
    pcall(function() require("luasnip.loaders.from_vscode").lazy_load() end)

    -- Your local Lua snippets
    local local_paths = {
      vim.fn.stdpath("config") .. "/lua/snippets", -- you already use this
      -- vim.fn.stdpath("config") .. "/snippets",   -- add later if you want
    }
    require("luasnip.loaders.from_lua").lazy_load({ paths = local_paths })
  end,
}

