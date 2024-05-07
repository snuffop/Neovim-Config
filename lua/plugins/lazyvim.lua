return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    enable = false,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "--" },
        },
      },
    },
  },
}
