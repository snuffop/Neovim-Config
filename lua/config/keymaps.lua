-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Whichkey  maps based on mode
vim.api.nvim_set_keymap("n", "<M-k>", "<cmd>WhichKey<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-k>", "<cmd>WhichKey<space>v<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<cmd>WhichKey<space>i<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<M-k>", "<cmd>WhichKey<space>c<cr>", { noremap = true, silent = true })

-- Move blocks of visually selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quick Escape
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("i", "jk", "<ESC>", { silent = true })
vim.keymap.set("i", "kj", "<ESC>", { silent = true })

-- Snippet Jump in insert mode
vim.keymap.set({ "i", "s" }, "<C-j>", function()
  vim.snippet.jump(1)
end)
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  vim.snippet.jump(-1)
end)

-- Start Peek for the current session
vim.keymap.set("n", "<F3>", "<cmd>PeekOpen<cr>", { desc = "Peek Open" })

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- reload keymaps
vim.keymap.set(
  "n",
  "<leader><leader>k",
  "<cmd>source ~/.config/nvim/lua/config/keymaps.lua<cr>",
  { desc = "Reload keymaps.lua" }
)

-- reload snippets
vim.keymap.set(
  "n",
  "<leader><leader>s",
  "<cmd>source ~/.config/nvim/after/plugin/snippets.lua<cr>",
  { desc = "Reload luasnip.lua" }
)

local map = LazyVim.safe_keymap_set

-- TmuxNavigate
map("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Tmux Down" })
map("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<cr>", { desc = "Tmux Last Active" })
map("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>", { desc = "Tmux Next" })

-- Buffer
map("n", "<leader>bB", "<cmd>Telescope buffers<cr>", { desc = "Telescope Buffers" })

-- File
map("n", "<leader>fs", "<cmd>up<cr>", { desc = "File Save" })
map("n", "<leader>fS", "<cmd>w !sudo tee %<CR>", { desc = "Sudo Write" })

-- Git
map("n", "<leader>gn", "<cmd>Neogit<cr>", { desc = "Neogit" })
map("n", "<leader>gbt", "<cmd>GitBlameToggle<cr>", { desc = "Git Blame Toggle" })
map("n", "<leader>gbe", "<cmd>GitBlameEnable<cr>", { desc = "Git Blame Enable" })
map("n", "<leader>gbd", "<cmd>GitBlameDisable<cr>", { desc = "Git Blame Disable" })
map("n", "<leader>gbo", "<cmd>GitBlameOpenCommitURL<cr>", { desc = "Git Blame Open Commit URL" })
map("n", "<leader>gbf", "<cmd>GitBlameOpenFileURL<cr>", { desc = "Git Blame Open file URL" })
map("n", "<leader>gbc", "<cmd>GitBlameCopySHA<cr>", { desc = "Git Blame Copy SHA" })
map("n", "<leader>gbC", "<cmd>GitBlameCopyCommitURL<cr>", { desc = "Git Blame Copy Commit URL" })
map("n", "<leader>gT", "<cmd>Tardis<cr>", { desc = "Tardis (TimeMachine)" })

-- Notes
map("n", "<leader>zz", "<cmd>ZkNotes { sort = { 'modified' }}<cr>", { desc = "ZK Notes" })
map(
  "n",
  "<leader>zZ",
  "<cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<cr>",
  { desc = "ZK Notes Search" }
)
map("n", "<leader>zb", "<Cmd>ZkBacklinks<cr>", { desc = "ZK Backlinks" })
map("n", "<leader>zj", "<Cmd>ZkNew { dir = 'journals', date = 'today'}<cr>", { desc = "ZK Journal Today" })
map("n", "<leader>zy", "<Cmd>ZkNew { dir = 'journals', date = 'yesterday'}<cr>", { desc = "ZK Journal Yesterday" })
map("n", "<leader>zi", "<Cmd>ZkInsertLink<cr>", { desc = "ZK Insert Link" })
map("n", "<leader>zl", "<Cmd>ZkLinks<cr>", { desc = "ZK Links" })
map("n", "<leader>zm", "<Cmd>ZkMatch<cr>", { desc = "ZK Match Selected" })
map("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ')}<cr>", { desc = "ZK New note" })
map("n", "<leader>zt", "<Cmd>ZkTags<cr>", { desc = "ZK Tags" })

-- Open

map("n", "<leader>omg", "<cmd>find ~/Nextcloud/Neorg/Todo.norg<cr>", { desc = "Open My Todo's" })

-- Project
map("n", "<leader>pp", "<cmd>Telescope projects<cr>", { desc = "Projects" })

--  Search / Telescop4e

map("n", "<leader>sf", "<cmd>Telescope filetypes<cr>", { desc = "Search Filetype" })
map("n", "<leader>sN", "<cmd>Telescope nerdy<cr>", { desc = "Search Nerdy" })

-- UI
map("n", "<leader>um", "<cmd>TableModeToggle<cr>", { desc = "Toggle Table Mode" })
map("n", "<leader>uR", "<cmd>ReaderMode<cr>", { desc = "Toggle ReaderMode" })
map("n", "<leader>uWt", "<cmd>lua require('wrapping').toggle_wrap_mode()<cr>", { desc = "Toggle wrapping mode" })
map("n", "<leader>uWh", "<cmd>lua require('wrapping').hard_wrap_mode()<cr>", { desc = "Hard wrap mode" })
map("n", "<leader>uWs", "<cmd>lua require('wrapping').soft_wrap_mode()<cr>", { desc = "Soft wrap mode" })
