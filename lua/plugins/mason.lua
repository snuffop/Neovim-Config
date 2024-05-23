-- add any tools you want to have installed below
-- https://github.com/frostplexx/mason-bridge.nvim
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
    config = function()
      require("mason").setup()
    end,
  },

  {
    "frostplexx/mason-bridge.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-bridge").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "frostplexx/mason-bridge.nvim",
    },
  },

  {
    "mfussenegger/nvim-lint",
    depnedencies = {
      "williamboman/mason.nvim",
      "frostplexx/mason-bridge.nvim",
    },
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
