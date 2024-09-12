--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- Oil git status
return {
  "refractalize/oil-git-status.nvim",
  dependencies = {
    "stevearc/oil.nvim",
  },
  config = function()
    require("oil").setup({
      win_options = {
        signcolumn = "yes:2",
      },
    })
  end,
}
