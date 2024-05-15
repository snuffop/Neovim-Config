return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    enable = false,
  },

  {
    "nvimdev/dashboard-nvim",
    enable = false,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      local markdownlint = require("lint").linters.markdownlint
      markdownlint.args = {
        "--disable",
        "MD013",
        "MD007",
        "--", -- Required
      }
    end,
  },
}
