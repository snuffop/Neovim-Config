-- Org-mode  or  nvim-orgmode

return {
  {
    "akinsho/org-bullets.nvim",
    config = function()
      require("org-bullets").setup({
        concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
      })
    end,
  },

  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true, -- or `opts = {}`
  },

  {
    "nvim-orgmode/orgmode",
    dependencies = {
      "akinsho/org-bullets.nvim",
      "lukas-reineke/headlines.nvim",
      "dhruvasagar/vim-table-mode",
    },
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/Nextcloud/Notes/org/orgzly/*",
        org_default_notes_file = "~/Nextcloud/Notes/org/orgzly/inbox.org",
      })
    end,
  },
}
