--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

local M = {
  "vhyrro/luarocks.nvim",
  priority = 1000,
  config = true,
  opts = {
    rocks = {
      "magick",
    },
  },
}

return M
