--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
  "chipsenkbeil/org-roam.nvim",
  tag = "0.1.1",
  lazy = false,
  dependencies = {
    {
      "nvim-orgmode/orgmode",
      tag = "0.3.7",
    },
  },
  config = function()
    require("org-roam").setup({
      directory = "~/Nextcloud/Org/Roam",
      -- optional
      -- org_files = {
      --   "~/another_org_dir",
      --   "~/some/folder/*.org",
      --   "~/a/single/org_file.org",
      -- }
    })
  end
}
