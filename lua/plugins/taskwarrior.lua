return {
  {
    "ribelo/taskwarrior.nvim",
    cmd = "Task",
    config = function ()
      require("taskwarrior.nvim").setup()
    end,
  },
}
