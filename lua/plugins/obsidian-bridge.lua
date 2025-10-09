--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯


-- lua/plugins/obsidian-bridge.lua
return {
  {
    "oflisback/obsidian-bridge.nvim",
    lazy = true,
    event = { "BufReadPre *.md", "BufNewFile *.md" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- If you left REST API on default HTTP:
      obsidian_server_address = "http://localhost:27123",
      -- If you enabled HTTPS in the REST API plugin, use:
      -- obsidian_server_address = "https://127.0.0.1:27124",
      -- cert_path = "~/.ssl/obsidian.crt",  -- if using HTTPS (see repo README)
      scroll_sync = false,                   -- set true only if you install the special “with scroll” build
      warnings = true,
      picker = "telescope",                  -- or "fzf_lua"
    },
    keys = {
      { "<leader>obO", "<cmd>ObsidianBridgeOpenCurrentActiveFile<CR>", desc = "Open Obsidian’s active file in nvim" },
      { "<leader>obg", "<cmd>ObsidianBridgeOpenGraph<CR>",             desc = "Show Obsidian Graph" },
      { "<leader>obd", "<cmd>ObsidianBridgeDailyNote<CR>",             desc = "Open Obsidian daily note" },
      { "<leader>obc", "<cmd>ObsidianBridgePickCommand<CR>",           desc = "Run Obsidian command" },
      { "<leader>obx", "<cmd>ObsidianBridgeToggle<CR>",                desc = "Toggle bridge on/off" },
    },
  },
}

