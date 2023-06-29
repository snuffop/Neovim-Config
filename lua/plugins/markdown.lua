return {

{ "itchyny/calendar.vim", 
    cmd = { "Calendar" }
  },
  { "folke/twilight.nvim",
    config = true,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" }
  },

  { "folke/zen-mode.nvim", 
    config = true, 
    cmd = { "ZenMode" }
  },

  { "dhruvasagar/vim-table-mode", 
    ft = { "markdown", "org", "norg" } 
  },

  { "lukas-reineke/headlines.nvim", 
    config = true, 
    ft = { "markdown", "org", "norg" }
  },

  {
    "jbyuki/nabla.nvim",
    --stylua: ignore
    keys = {
      { "<leader>nn", function() require("nabla").popup() end, desc = "Notation", },
    },
    config = function()
      require("nabla").enable_virt()
    end,
  },
  {
    "vim-pandoc/vim-pandoc",
    event = "VeryLazy",
    enabled = false,
    dependencies = { "vim-pandoc/vim-pandoc-syntax" },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = "MarkdownPreview",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
}
