--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

--YAZI
return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>fm",
      function()
        require("yazi").yazi()
      end,
      desc = "Open the yazi file manager",
    },
    {
      "<leader>fy",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open the yazi file manager in nvim's working directory",
    },
  },
}
