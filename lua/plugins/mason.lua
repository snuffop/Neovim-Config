--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/mason-nvim.lua

-- https://github.com/williamboman/mason.nvim
-- https://github.com/jonschlinkert/markdown-toc
return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "templ",
      "harper-ls",
    },
  },
}
