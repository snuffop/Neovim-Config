--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/mason-nvim.lua

-- https://github.com/williamboman/mason.nvim
-- https://github.com/jonschlinkert/markdown-toc
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "templ",
      "html-lsp",
      "htmx-lsp",
      "tailwindcss-language-server",
      "harper-ls",
    },
  },
}
