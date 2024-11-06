--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯
-- 

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
  { "<leader>gb", group = "GIT Blame"},
  { "<leader>n", group = "+Notes"},
  { "<leader>nd", group = "+Denote"},
  { "<leader>T", group = "+TaskWarrior"},
  { "<leader>o", group = "+org-mode"},
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

map("n", "<leader>gn", "<cmd>Neogit<cr>", { desc = "Neogit" })
map("n", "<leader>gbt", "<cmd>GitBlameToggle<cr>", { desc = "Git Blame Toggle" })
map("n", "<leader>gbe", "<cmd>GitBlameEnable<cr>", { desc = "Git Blame Enable" })
map("n", "<leader>gbd", "<cmd>GitBlameDisable<cr>", { desc = "Git Blame Disable" })
map("n", "<leader>gbo", "<cmd>GitBlameOpenCommitURL<cr>", { desc = "Git Blame Open Commit URL" })
map("n", "<leader>gbf", "<cmd>GitBlameOpenFileURL<cr>", { desc = "Git Blame Open file URL" })
map("n", "<leader>gbc", "<cmd>GitBlameCopySHA<cr>", { desc = "Git Blame Copy SHA" })
map("n", "<leader>gbC", "<cmd>GitBlameCopyCommitURL<cr>", { desc = "Git Blame Copy Commit URL" })
map("n", "<leader>gT", "<cmd>Tardis<cr>", { desc = "Tardis (TimeMachine)" })
map("n", "<leader>gm", "<cmd>GitMessenger<cr>", { desc = "Git Messenger" })

-- ZK

map("n", "<leader>nI", "<Cmd>ZkIndex<CR>", { desc = "ZK index" })
map("n", "<leader>nb", "<Cmd>ZkBacklinks<CR>", { desc = "ZK Backlinks" })
map("n", "<leader>nc", "<Cmd>ZkCd<CR>", { desc = "ZK cd" })
map("n", "<leader>nz", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", { desc = "ZK Find" })
map("n", "<leader>ni", "<Cmd>ZkInsertLink<CR>", { desc = "ZK Insert Link" })
map("n", "<leader>nj", "<Cmd>! daily-file.sh<CR>", { desc = "ZK Daily Journal" })
map("n", "<leader>nl", "<Cmd>ZkLinks<CR>", { desc = "ZK Links" })
map("n", "<leader>nN", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", { desc = "ZK New" })
map("n", "<leader>no", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", { desc = "ZK Notes" })
map("n", "<leader>nr", "<Cmd>ZkNotes { createdAfter = '3 days ago' }<CR>", { desc = "ZK Recent" })
map("n", "<leader>nt", "<Cmd>ZkTags<CR>", { desc = "ZK Tags" })
map("v", "<leader>nf", "<Cmd>:'<,'>ZkMatch<CR>", { desc = "ZK Match" })
map("v", "<leader>ni", "<Cmd>:'<,'>ZkInsertLinkAtSelection<CR>", { desc = "ZK Insert Link" })
map("v", "<leader>nN", "<Cmd>'<,'>ZkNewFromTitleSelection<CR>", { desc = "ZK New" })


map("n", "<leader>ob",  "<cmd>ObsidianBacklinks<cr>", { desc = "Obsidian Back Links"})
map("n", "<leader>od",  "<cmd>ObsidianDailies<cr>",{ desc = "Obsidian Dailies"})
map("n", "<leader>ol",  "<cmd>ObsidianLink<cr>",{ desc = "Obsidian Link"})
map("n", "<leader>on",  "<cmd>ObsidianNew<cr>",{ desc = "Obsidian New"})
map("n", "<leader>oO",  "<cmd>ObsidianOpen<cr>",{ desc = "Obsidian Open"})
map("n", "<leader>oo",  "<cmd>ObsidianQuickSwitch<cr>",{ desc = "Obsidian Quick Search"})
map("n", "<leader>or",  "<cmd>ObsidianRename<cr>",{ desc = "Obsidian Rename"})
map("n", "<leader>os",  "<cmd>ObsidianSearch<cr>",{ desc = "Obsidian Search"})
map("n", "<leader>ot",  "<cmd>ObsidianTags<cr>",{ desc = "Obsidian Tags"})
map("n", "<leader>oT",  "<cmd>ObsidianTemplate<cr>",{ desc = "Obsidian Template"})
map("n", "<leader>oj",  "<cmd>ObsidianToday<cr>",{ desc = "Obsidian Today"})
map("n", "<leader>o+",  "<cmd>ObsidianTomorrow<cr>",{ desc = "Obsidian Tomorrow"})
map("n", "<leader>o-",  "<cmd>ObsidianYesterday<cr>",{ desc = "Obsidian Yesterday"})

-- Denote
map("n", "<leader>ndn", "<cmd>DenoteNewNote<CR>", {desc = "New Note" })
map("n", "<leader>ndt", "<cmd>DenoteChangeTitle<CR>", { desc = "Change Title" })
map("n", "<leader>ndg", "<cmd>DenoteChangeTags<CR>", { desc = "Change Tags" })
map("n", "<leader>ndl", "<cmd>DenotePutNotesListForTags<CR>", { desc = "Put Notes List" })
map("n", "<leader>nda", "<cmd>DenotePutNoteActionsForTags<CR>", { desc = "Put Notes Actions" })
map("n", "<leader>ndb", "<cmd>DenotePutNoteBacklinksForBuffer<CR>", { desc = "Put Backlinks" })
map("n", "<leader>ndf", "<cmd>DenoteFollowLink<CR>", { desc = "Follow Link" })

--  Search / Telescope

map("n", "<leader>sf", "<cmd>Telescope filetypes<cr>", { desc = "Search Filetype" })
map("n", "<leader>sN", "<cmd>Telescope nerdy<cr>", { desc = "Search Nerdy" })

-- UI

map("n", "<leader>um", "<cmd>TableModeToggle<cr>", { desc = "Toggle Table Mode" })
map("n", "<leader>uM", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle Render Markdown Mode" })
map("n", "<leader>uR", "<cmd>ReaderMode<cr>", { desc = "Toggle ReaderMode" })
map("n", "<leader>uWt", "<cmd>lua require('wrapping').toggle_wrap_mode()<cr>", { desc = "Toggle wrapping mode" })
map("n", "<leader>uWh", "<cmd>lua require('wrapping').hard_wrap_mode()<cr>", { desc = "Hard wrap mode" })
map("n", "<leader>uWs", "<cmd>lua require('wrapping').soft_wrap_mode()<cr>", { desc = "Soft wrap mode" })
