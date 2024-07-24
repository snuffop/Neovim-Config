-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- attempt to remap lines for autocomplete
-- vim.cmd([[
--     inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))
--     inoremap <expr> j pumvisible() ? "\<C-n>" : "j"
--     inoremap <expr> k pumvisible() ? "\<C-p>" : "k"
-- ]])
--
-- Whichkey  maps based on mode
vim.cmd([[
    nnoremap <M-k> <cmd>WhichKey<cr>
    vnoremap <M-k> <cmd>WhichKey '' v<cr>
    inoremap <M-k> <cmd>WhichKey '' i<cr>
    cnoremap <M-k> <cmd>WhichKey '' c<cr>
]])

-- Move blocks of visually selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
map("n", "<leader>nN", "<cmd>Neorg keybind norg core.dirman.new.note<cr>", { desc = "Neorg new note" })
map("n", "<leader>nT", "<cmd>Neorg toc qflist<cr>", { desc = "TOC Quick list" })
map("n", "<leader>ncT", "<cmd>Neorg journal toc<cr>", { desc = "TOC" })
map("n", "<leader>ni", "<cmd>Neorg index<cr>", { desc = "neorg index" })
map("n", "<leader>njc", "<cmd>Neorg journal custom<cr>", { desc = "custom" })
map("n", "<leader>njj", "<cmd>Neorg journal today<cr>", { desc = "today" })
map("n", "<leader>njm", "<cmd>Neorg templates load journal<cr>", { desc = "Apply journal template" })
map("n", "<leader>njt", "<cmd>Neorg journal tomorrow<cr>", { desc = "tomorrow" })
map("n", "<leader>njy", "<cmd>Neorg journal yesterday<cr>", { desc = "yesterday" })
map("n", "<leader>nml", "<cmd>Neorg module load<cr>", { desc = "Load modules" })
map("n", "<leader>nmm", "<cmd>Neorg module list<cr>", { desc = "List modules" })
map("n", "<leader>nn", "<cmd>Telescope neorg find_norg_files<cr>", { desc = "Find files " })
map("n", "<leader>nr", "<cmd>Neorg return<cr>", { desc = "neorg return" })
map("n", "<leader>nsA", "<cmd>Telescope neorg find_aof_project_tasks<cr>", { desc = "AOF project tasks" })
map("n", "<leader>nsI", "<cmd>Telescope neorg insert_link<cr>", { desc = "Insert link" })
map("n", "<leader>nsa", "<cmd>Telescope neorg find_aof_tasks<cr>", { desc = "AOF taksks " })
map("n", "<leader>nsb", "<cmd>Telescope neorg find_backlinks<cr>", { desc = "Find backlinks " })
map("n", "<leader>nsf", "<cmd>Telescope neorg find_linkable<cr>", { desc = "Find linkable" })
map("n", "<leader>nsh", "<cmd>Telescope neorg search_headings<cr>", { desc = "Search headings " })
map("n", "<leader>nsi", "<cmd>Telescope neorg insert_file_link<cr>", { desc = "Insert file link" })
map("n", "<leader>nss", "<cmd>Telescope neorg search_headings<cr>", { desc = "Search headings" })
map("n", "<leader>nwn", "<cmd>Neorg workspace notes<cr>", { desc = "Notes workspace" })
map("n", "<leader>nxi", "<cmd>Neorg inject-metadata<cr>", { desc = "inject metadata" })
map("n", "<leader>nxs", "<cmd>Neorg generate-workspace-summary<cr>", { desc = "Generate summary" })
map("n", "<leader>nxu", "<cmd>Neorg update-metadata<cr>", { desc = "update metadata" })
map("n", "<leader>nzz", "<cmd>ZkNotes { sort = { 'modified' }}<cr>", { desc = "ZK Notes" })
map(
  "n",
  "<leader>nzZ",
  "<cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<cr>",
  { desc = "ZK Notes Search" }
)
map("n", "<leader>nzb", "<cmd>ZkBackLinks<cr>", { desc = "ZK Backlinks" })
map("n", "<leader>nzi", "<cmd>ZkInsertLink<cr>", { desc = "ZK Insert Link" })
map("n", "<leader>nzl", "<cmd>ZkLinks<cr>", { desc = "ZK Links" })
map("n", "<leader>nzm", "<cmd>ZkMatch<cr>", { desc = "ZK Match Selected" })
map("n", "<leader>nzn", "<cmd>ZkNew { title = vim.fn.input('Title: ')}<cr>", { desc = "ZK New note" })
map("n", "<leader>nzt", "<cmd>ZkTags<cr>", { desc = "ZK Tags" })

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
