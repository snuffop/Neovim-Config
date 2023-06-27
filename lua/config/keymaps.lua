-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local wk = require("which-key")

vim.keymap.set("n", "<leader>fs", "<cmd>up<cr><esc>", { noremap = true, silent = true, desc = "Save File" })

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

wk.register({
  ["<leader>n"] = { name = "+notes" },
  ["<leader>no"] = { name = "+obsidian" },
  ["<leader>noC"] = { "<cmd>ObsidianCheckHealth<cr>", "Check Health" },
  ["<leader>noT"] = { "<cmd>ObsidianTomorrow<cr>", "Tomorrow" },
  ["<leader>nob"] = { "<cmd>ObsidianBacklinks<cr>", "Backlinks" },
  ["<leader>noc"] = { "<cmd>ObsidianCheck<cr>", "Check" },
  ["<leader>nof"] = { "<cmd>ObsidianFollowLink<cr>", "Follow Link" },
  ["<leader>nol"] = { "<cmd>ObsidianLink<cr>", "Link" },
  ["<leader>non"] = { "<cmd>ObsidianNew<cr>", "New Note" },
  ["<leader>noo"] = { "<cmd>ObsidianOpen<cr>", "Open" },
  ["<leader>noq"] = { "<cmd>ObsidianQuickSwitch<cr>", "Quick Switch" },
  ["<leader>nos"] = { "<cmd>ObsidianSearch<cr>", "Search" },
  ["<leader>not"] = { "<cmd>ObsidianToday<cr>", "Today" },
  ["<leader>noy"] = { "<cmd>ObsidianYesterday<cr>", "Yesterday" },
})
