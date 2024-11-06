--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
  "oflisback/obsidian-bridge.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian-bridge").setup()
  end,
  event = {
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  cmd = {
    "ObsidianBridgeDailyNote",
    "ObsidianBridgeOpenGraph",
    "ObsidianBridgeOpenVaultMenu",
    "ObsidianBridgeTelescopeCommand",
  },
}
