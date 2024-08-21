return {
  "Rics-Dev/project-explorer.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    paths = {
            "~/Source/*",
            "~/mnt/ssh/joystation/Source/*",
        },
    newProjectPath = "~/Source/",
    file_explorer = function(dir)
      require("oil").open(dir)
    end,
  },
  config = function(_, opts)
    require("project_explorer").setup(opts)
  end,
  keys = {
    { "<leader>fp", "<cmd>ProjectExplorer<cr>", desc = "Project Explorer" },
  },
  lazy = false,
}
