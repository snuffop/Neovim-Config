-- add more treesitter parsers
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "org",
      "bash",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
  },
}
