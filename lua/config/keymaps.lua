-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- attempt to remap lines for autocomplete
vim.cmd([[
    inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))
    inoremap <expr> j pumvisible() ? "\<C-n>" : "j"
    inoremap <expr> k pumvisible() ? "\<C-p>" : "k"
]])

-- Whichkey  maps based on mode
vim.cmd([[
nnoremap <M-k> <cmd>WhichKey<cr>
vnoremap <M-k> <cmd>WhichKey '' v<cr>
inoremap <M-k> <cmd>WhichKey '' i<cr>
cnoremap <M-k> <cmd>WhichKey '' c<cr>
]])

-- Neorg overrides
vim.cmd([[
inoremap  <C-i> <cmd>Telescope neorg insert_link<cr>
inoremap  <C-l> <cmd>Telescope neorg insert_file_link<cr>
inoremap  <C-s> <cmd>Telescope neorg find_linkable<cr>  
]])

-- TmuxNavigate
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux Down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux Right" })

-- Misc
map("n", "<leader>-", "<cmd>Oil<cr>", { desc = "Oil" })
-- File
map("n", "<leader>fs", "<cmd>up<cr>", { desc = "File Save" })
map("n", "<leader>fmr", "<cmd>Ranger<cr>", { desc = "Ranger" })
map("n", "<leader>fmn", "<cmd>Nnn<cr>", { desc = "N3" })
map("n", "<leader>fml", "<cmd>Lazygit<cr>", { desc = "Lazygit" })
map("n", "<leader>fD", "<cmd>Distant<cr>", { desc = "Distant" })
map("n", "<leader>fz", "<cmd>Telescope zoxide list<cr>", { desc = "Telescope Zoxide" })

-- Git
map("n", "<leader>gn", "<cmd>Neogit<cr>", { desc = "Neogit" })
map("n", "<leader>gbt", "<cmd>GitBlameToggle<cr>", { desc = "Git Blame Toggle" })
map("n", "<leader>gbe", "<cmd>GitBlameEnable<cr>", { desc = "Git Blame Enable" })
map("n", "<leader>gbd", "<cmd>GitBlameDisable<cr>", { desc = "Git Blame Disable" })
map("n", "<leader>gbo", "<cmd>GitBlameOpenCommitURL<cr>", { desc = "Git Blame Open Commit URL" })
map("n", "<leader>gbf", "<cmd>GitBlameOpenFileURL<cr>", { desc = "Git Blame Open file URL" })
map("n", "<leader>gbc", "<cmd>GitBlameCopySHA<cr>", { desc = "Git Blame Copy SHA" })
map("n", "<leader>gbC", "<cmd>GitBlameCopyCommitURL<cr>", { desc = "Git Blame Copy Commit URL" })

-- Notes
map("n", "<leader>nmm", "<cmd>Neorg module list<cr>", { desc = "List Modules" })
map("n", "<leader>nml", "<cmd>Neorg module load<cr>", { desc = "Load Modules" })
map("n", "<leader>nn", "<cmd>Neorg index<cr>", { desc = "neorg index" })
map("n", "<leader>nN", "<cmd>Neorg keybind norg core.dirman.new.note<cr>", { desc = "Neorg New Note" })
map("n", "<leader>nr", "<cmd>Neorg return<cr>", { desc = "neorg return" })
map("n", "<leader>nts", "<cmd>Telescope neorg search_headings<cr>", { desc = "Search headings" })
map("n", "<leader>ntf", "<cmd>Telescope neorg find_linkable<cr>", { desc = "Find linkable" })
map("n", "<leader>nti", "<cmd>Telescope neorg insert_file_link<cr>", { desc = "Insert file link" })
map("n", "<leader>ntI", "<cmd>Telescope neorg insert_link<cr>", { desc = "Insert link" })
map("n", "<leader>nta", "<cmd>Telescope neorg find_aof_tasks<cr>", { desc = "AOF Taksks " })
map("n", "<leader>ntA", "<cmd>Telescope neorg find_aof_project_tasks<cr>", { desc = "AOF project tasks" })
map("n", "<leader>ntb", "<cmd>Telescope neorg find_backlinks<cr>", { desc = "Find Backlinks " })
map("n", "<leader>ntt", "<cmd>Telescope neorg find_neorg_files_<cr>", { desc = "Find Files " })
map("n", "<leader>nth", "<cmd>Telescope neorg search_headings<cr>", { desc = "Search Headings " })
map("n", "<leader>nT", "<cmd>Neorg toc qflist<cr>", { desc = "TOC Quick list" })
map("n", "<leader>njj", "<cmd>Neorg journal today<cr>", { desc = "today" })
map("n", "<leader>njt", "<cmd>Neorg journal tomorrow<cr>", { desc = "tomorrow" })
map("n", "<leader>njy", "<cmd>Neorg journal yesterday<cr>", { desc = "yesterday" })
map("n", "<leader>njc", "<cmd>Neorg journal custom<cr>", { desc = "custom" })
map("n", "<leader>ncT", "<cmd>Neorg journal toc<cr>", { desc = "TOC" })
map("n", "<leader>njm", "<cmd>Neorg journal template<cr>", { desc = "template" })
map("n", "<leader>nxs", "<cmd>Neorg generate-workspace-summary<cr>", { desc = "neorg summary" })
map("n", "<leader>nxi", "<cmd>Neorg inject-metadata<cr>", { desc = "inject metadata" })
map("n", "<leader>nxu", "<cmd>Neorg update-metadata<cr>", { desc = "update metadata" })
map("n", "<leader>nwn", "<cmd>Neorg workspace notes<cr>", { desc = "Notes workspace" })
map("n", "<leader>nwj", "<cmd>Neorg workspace joyent<cr>", { desc = "Joyent workspace" })

-- Project
map("n", "<leader>pf", "<cmd>Telescope projects<cr>", { desc = "Project Files" })

-- Text/Toggle
map("n", "<leader>tu", "<cmd>Telescope undo<cr>", { desc = "Telescope Undo" })

-- UI
map("n", "<leader>um", "<cmd>TableModeToggle<cr>", { desc = "Table Mode Toggle" })
