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
  -- { "<leader>gb", group = "GIT Blame"},
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
map("n", "<leader>bx", "<cmd>ScratchOpen<cr>", { desc = "Scratch Buffer Open"})
map("n", "<leader>bs", "<cmd>Scratch<cr>", { desc = "Scratch Buffer"})

-- code insertions

map("n", "<leader>cj", "<cmd>lua require('jq').run()<cr>", { desc = "JQ Interface" })

-- File

map("n", "<leader>fs", "<cmd>up<cr>", { desc = "File Save" })
map("n", "<leader>fS", "<cmd>w !sudo tee %<CR>", { desc = "Sudo Write" })

-- Git

map("n", "<leader>gT", "<cmd>Tardis<cr>", { desc = "Tardis (TimeMachine)" })
map("n", "<leader>gm", "<cmd>GitMessenger<cr>", { desc = "Git Messenger" })

-- Obsidian

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

-- ZK

map("v", "<leader>na", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", { desc = "ZK LSP code Action" })
map("n", "<leader>nI", "<Cmd>ZkIndex<CR>", { desc = "ZK index" })
map("n", "<leader>nN", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", { desc = "ZK New" })
map("n", "<leader>nb", "<Cmd>ZkBacklinks<CR>", { desc = "ZK Backlinks" })
map("n", "<leader>nc", "<Cmd>ZkCd<CR>", { desc = "ZK cd" })
map("v", "<leader>nc", ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", { desc = "New from Content Selection" })
map("n", "<leader>ni", "<Cmd>ZkInsertLink<CR>", { desc = "ZK Insert Link" })
map("n", "<leader>nj", "<Cmd>! daily-file.sh<CR>", { desc = "ZK Daily Journal" })
map("n", "<leader>nl", "<Cmd>ZkLinks<CR>", { desc = "ZK Links" })
map("n", "<leader>nn", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", { desc = "ZK Notes" })
map("n", "<leader>nr", "<Cmd>ZkNotes { createdAfter = '3 days ago' }<CR>", { desc = "ZK Recent" })
map("n", "<leader>nt", "<Cmd>ZkTags<CR>", { desc = "ZK Tags" })
map("n", "<leader>ns", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", { desc = "ZK Find" })
map("v", "<leader>nN", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", { desc = "ZK New from Title Selection" })
map("v", "<leader>nf", "<Cmd>:'<,'>ZkMatch<CR>", { desc = "ZK Match" })
map("v", "<leader>ni", "<Cmd>:'<,'>ZkInsertLinkAtSelection<CR>", { desc = "ZK Insert Link" })

--  Search / Telescope

map("n", "<leader>sp", "<cmd>Telescope projects<cr>", { desc = "Search projects" })
map("n", "<leader>sf", "<cmd>Telescope filetypes<cr>", { desc = "Search Filetype" })
map("n", "<leader>sN", "<cmd>Telescope nerdy<cr>", { desc = "Search Nerdy" })

-- UI

map("n", "<leader>um", "<cmd>TableModeToggle<cr>", { desc = "Toggle Table Mode" })
map("n", "<leader>uR", "<cmd>ReaderMode<cr>", { desc = "Toggle ReaderMode" })
map("n", "<leader>uWt", "<cmd>lua require('wrapping').toggle_wrap_mode()<cr>", { desc = "Toggle wrapping mode" })
map("n", "<leader>uWh", "<cmd>lua require('wrapping').hard_wrap_mode()<cr>", { desc = "Hard wrap mode" })
map("n", "<leader>uWs", "<cmd>lua require('wrapping').soft_wrap_mode()<cr>", { desc = "Soft wrap mode" })
map("n", "<leader>uP", "<cmd>Pencil<cr>", { desc = "Pencil Mode" })
map("n", "<leader>uz", "<cmd>ZenMode<cr>", { desc = "Twilight Mode" })
