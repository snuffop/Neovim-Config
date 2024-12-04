--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

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

-- Which-key  Alt-K top level keymaps display

vim.api.nvim_set_keymap("n", "<M-k>", "<cmd>WhichKey<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-k>", "<cmd>WhichKey<space>v<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<cmd>WhichKey<space>i<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<M-k>", "<cmd>WhichKey<space>c<cr>", { noremap = true, silent = true })

-- Which-Key Top level labels

local wk = require("which-key")
wk.add({
  { "<leader>n", group = "+Notes"},
  { "<leader>T", group = "+TaskWarrior"},
})

local map = LazyVim.safe_keymap_set

-- Tmux Navigate

map("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Tmux Down" })
map("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<cr>", { desc = "Tmux Last Active" })
map("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>", { desc = "Tmux Next" })

-- Buffer

map("n", "<leader>bB", "<cmd>Telescope buffers<cr>", { desc = "Telescope Buffers" })

-- code insertions

map("n", "<leader>cj", "<cmd>lua require('jq').run()<cr>", { desc = "JQ Interface" })

-- File

map("n", "<leader>fs", "<cmd>up<cr>", { desc = "File Save" })
map("n", "<leader>fS", "<cmd>w !sudo tee %<CR>", { desc = "Sudo Write" })

-- Git

map("n", "<leader>gT", "<cmd>Tardis<cr>", { desc = "Tardis (TimeMachine)" })
map("n", "<leader>gm", "<cmd>GitMessenger<cr>", { desc = "Git Messenger" })

-- ZK

-- map("v", "<leader>na", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", { desc = "ZK LSP code Action" })
-- map("n", "<leader>nI", "<Cmd>ZkIndex<CR>", { desc = "ZK index" })
-- map("n", "<leader>nN", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", { desc = "ZK New" })
-- map("n", "<leader>nb", "<Cmd>ZkBacklinks<CR>", { desc = "ZK Backlinks" })
-- map("n", "<leader>nc", "<Cmd>ZkCd<CR>", { desc = "ZK cd" })
-- map("v", "<leader>nc", ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", { desc = "New from Content Selection" })
-- map("n", "<leader>ni", "<Cmd>ZkInsertLink<CR>", { desc = "ZK Insert Link" })
-- --map("n", "<leader>nj", "<Cmd>! daily-file.sh<CR>", { desc = "ZK Daily Journal" })
-- map("n", "<leader>nl", "<Cmd>ZkLinks<CR>", { desc = "ZK Links" })
-- map("n", "<leader>nn", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", { desc = "ZK Notes" })
-- map("n", "<leader>nr", "<Cmd>ZkNotes { createdAfter = '3 days ago' }<CR>", { desc = "ZK Recent" })
-- map("n", "<leader>nt", "<Cmd>ZkTags<CR>", { desc = "ZK Tags" })
-- map("n", "<leader>ns", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", { desc = "ZK Find" })
-- map("v", "<leader>nN", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", { desc = "ZK New from Title Selection" })
-- map("v", "<leader>nf", "<Cmd>:'<,'>ZkMatch<CR>", { desc = "ZK Match" })
-- map("v", "<leader>ni", "<Cmd>:'<,'>ZkInsertLinkAtSelection<CR>", { desc = "ZK Insert Link" })
--
-- -- Key map from copilot. son of a bitch. it worked.
-- vim.keymap.set("n", "<leader>nj", function()
--   local file = vim.fn.system("daily-file.sh")
--   file = vim.fn.trim(file) -- Remove any trailing newline characters
--   if vim.fn.filereadable(file) == 1 then
--     vim.cmd("edit " .. file)
--   else
--     print("File not found: " .. file)
--     require("zk.commands").get("ZkNew")({ dir = "journals" })
--   end
-- end, { desc = "Open file from script" })
-- NOTES 

map("n", "<leader>nC", "<cmd>ObsidianCheckHealth<cr>", { desc = "Check Health" })
map("n", "<leader>nL", "<cmd>ObsidianLinkNew<cr>", { desc = "Link New" })
map("n", "<leader>nN", "<cmd>ObsidianNew<cr>", { desc = "New Note" })
map("n", "<leader>nO", "<cmd>ObsidianOpen<cr>", { desc = "Open" })
map("n", "<leader>nT", "<cmd>ObsidianTemplate<cr>", { desc = "Add Template" })
map("n", "<leader>nb", "<cmd>ObsidianBacklinks<cr>", { desc = "Find Backlinks" })
map("n", "<leader>nc", "<cmd>ObsidianCheck<cr>", { desc = "Check" })
map("n", "<leader>nd", "<cmd>ObsidianDailies -30 2<cr>", { desc = "Open Dailies" })
map("n", "<leader>nf", "<cmd>ObsidianFollowLink<cr>", { desc = "Follow Link" })
map("n", "<leader>ng", "<cmd>ObsidianTags<cr>", { desc = "TAGS" })
map("n", "<leader>nl", "<cmd>ObsidianLinks<cr>", { desc = "List Links" })
map("n", "<leader>nn", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick Switch" })
map("n", "<leader>ns", "<cmd>ObsidianSearch<cr>", { desc = "Search" })
map("n", "<leader>nt", "<cmd>ObsidianToday<cr>", { desc = "Open Today" })
map("n", "<leader>nw", "<cmd>ObsidianTomorrow<cr>", { desc = "Open Tomorrow" })
map("n", "<leader>nx", "<cmd>ObsidianExtractNote<cr>", { desc = "Extract Note" })
map("n", "<leader>ny", "<cmd>ObsidianYesterday<cr>", { desc = "Open Yesterday" })

--  Search / Telescope

map("n", "<leader>sp", "<cmd>Telescope projects<cr>", { desc = "Search projects" })
map("n", "<leader>sf", "<cmd>Telescope filetypes<cr>", { desc = "Search Filetype" })
map("n", "<leader>sN", "<cmd>Telescope nerdy<cr>", { desc = "Search Nerdy" })

-- UI

map("n", "<leader>um", "<cmd>TableModeToggle<cr>", { desc = "Toggle Table Mode" })
map("n", "<leader>uP", "<cmd>Pencil<cr>", { desc = "Pencil Mode" })
map("n", "<leader>uz", "<cmd>ZenMode<cr>", { desc = "Twilight Mode" })
