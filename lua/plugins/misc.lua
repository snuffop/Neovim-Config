return {
  -- Wakatime 
  {
    'wakatime/vim-wakatime',
    lazy = false,
  },

  -- Vim Table mode
  {'dhruvasagar/vim-table-mode'},

  -- Vim Matchup
  {
    'andymass/vim-matchup',
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Vim Surround
  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function ()
      require("nvim-surround").setup({

      })
    end,
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    config = function ()
      require("Comment").setup{}
    end,
  },

  -- Project
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        require('telescope').load_extension('projects')
      }
    end,
  },
}

