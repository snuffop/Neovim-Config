-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

-- Move blocks of visually selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

local map = LazyVim.safe_keymap_set

-- TmuxNavigate
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux Down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux Right" })

-- Buffer
map("n", "<leader>bB", "<cmd>Telescope buffers<cr>", { desc = "Telescope Buffers" })

-- File
map("n", "<leader>fs", "<cmd>up<cr>", { desc = "File Save" })
map("n", "<leader>fS", "<cmd>w !sudo tee %<CR>", { desc = "Sudo Write" })
map("n", "<leader>fmr", "<cmd>Ranger<cr>", { desc = "Ranger" })
map("n", "<leader>fmn", "<cmd>Nnn<cr>", { desc = "N3" })
map("n", "<leader>fml", "<cmd>Lazygit<cr>", { desc = "Lazygit" })
map("n", "<leader>fmo", "<cmd>Oil<cr>", { desc = "Oil" })
map("n", "<leader>fD", "<cmd>Distant<cr>", { desc = "Distant" })
map("n", "<leader>fZ", "<cmd>Telescope zoxide list<cr>", { desc = "Telescope Zoxide" })
map("n", "<leader>fz", "<cmd>lua require('fzf-lua').files({ resume = true })<cr>", { desc = "FZF files" })
map("n", "<leader>fo", "<cmd>lua require('fzf-lua').oldfiles({ resume = true })<cr>", { desc = "FZF oldfiles" })

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
map("n", "<leader>nmm", "<cmd>Neorg module list<cr>", { desc = "List modules" })
map("n", "<leader>nml", "<cmd>Neorg module load<cr>", { desc = "Load modules" })
map("n", "<leader>nn", "<cmd>Neorg index<cr>", { desc = "neorg index" })
map("n", "<leader>nN", "<cmd>Neorg keybind norg core.dirman.new.note<cr>", { desc = "Neorg new note" })
map("n", "<leader>nr", "<cmd>Neorg return<cr>", { desc = "neorg return" })
map("n", "<leader>nts", "<cmd>Telescope neorg search_headings<cr>", { desc = "Search headings" })
map("n", "<leader>ntf", "<cmd>Telescope neorg find_linkable<cr>", { desc = "Find linkable" })
map("n", "<leader>nti", "<cmd>Telescope neorg insert_file_link<cr>", { desc = "Insert file link" })
map("n", "<leader>ntI", "<cmd>Telescope neorg insert_link<cr>", { desc = "Insert link" })
map("n", "<leader>nta", "<cmd>Telescope neorg find_aof_tasks<cr>", { desc = "AOF taksks " })
map("n", "<leader>ntA", "<cmd>Telescope neorg find_aof_project_tasks<cr>", { desc = "AOF project tasks" })
map("n", "<leader>ntb", "<cmd>Telescope neorg find_backlinks<cr>", { desc = "Find backlinks " })
map("n", "<leader>ntt", "<cmd>Telescope neorg find_norg_files<cr>", { desc = "Find files " })
map("n", "<leader>nth", "<cmd>Telescope neorg search_headings<cr>", { desc = "Search headings " })
map("n", "<leader>nT", "<cmd>Neorg toc qflist<cr>", { desc = "TOC Quick list" })
map("n", "<leader>njj", "<cmd>Neorg journal today<cr>", { desc = "today" })
map("n", "<leader>njt", "<cmd>Neorg journal tomorrow<cr>", { desc = "tomorrow" })
map("n", "<leader>njy", "<cmd>Neorg journal yesterday<cr>", { desc = "yesterday" })
map("n", "<leader>njc", "<cmd>Neorg journal custom<cr>", { desc = "custom" })
map("n", "<leader>ncT", "<cmd>Neorg journal toc<cr>", { desc = "TOC" })
map("n", "<leader>njm", "<cmd>Neorg templates load journal<cr>", { desc = "Apply journal template" })
map("n", "<leader>nxs", "<cmd>Neorg generate-workspace-summary<cr>", { desc = "Generate summary" })
map("n", "<leader>nxi", "<cmd>Neorg inject-metadata<cr>", { desc = "inject metadata" })
map("n", "<leader>nxu", "<cmd>Neorg update-metadata<cr>", { desc = "update metadata" })
map("n", "<leader>nwn", "<cmd>Neorg workspace notes<cr>", { desc = "Notes workspace" })

-- Open / Obsidian
map("n", "<leader>od", "<cmd>Dashboard<cr>", { desc = "Dashboard" })

map("n", "<leader>ojj", "<cmd>ObsidianToday<cr>", { desc = "Today" })
map("n", "<leader>ojy", "<cmd>ObsidianYesterday<cr>", { desc = "Yesterday" })
map("n", "<leader>ojt", "<cmd>ObsidianTomorrow<cr>", { desc = "Tomorrow" })
map("n", "<leader>ojs", "<cmd>ObsidianDailies -7 1<cr>", { desc = "Last 7" })
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Backlinks" })
map("n", "<leader>oc", "<cmd>ObsidianToggleCheckbox<cr>", { desc = "Toggle checkbox" })
map("n", "<leader>ol", "<cmd>Obsidianlink<cr>", { desc = "Link" })
map("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "New Zettel" })
map("n", "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian Quick Switch" })
map("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "Rename" })
map("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search" })
map("n", "<leader>ot", "<cmd>ObsidianTemplate<cr>", { desc = "Template" })
map("n", "<leader>oT", "<cmd>ObsidianTags<cr>", { desc = "Tags" })

-- Project
map("n", "<leader>pp", "<cmd>Telescope projects<cr>", { desc = "Projects" })

-- Remote
map("n", "<leader>rc", "<cmd>RemoteSSHConnect<cr>", { desc = "Connect" })
map("n", "<leader>rd", "<cmd>RemoteSSHFSDisconnect<cr>", { desc = "Disconnect" })
map("n", "<leader>re", "<cmd>RemoteSSHFSEdit<cr>", { desc = "Edit Config" })
map("n", "<leader>rf", "<cmd>RemoteSSHFSFindFiles<cr>", { desc = "Find Files" })
map("n", "<leader>rg", "<cmd>RemoteSSHFSLiveGrep<cr>", { desc = "Live Grep" })

-- Text/Toggle
map("n", "<leader>tu", "<cmd>Telescope undo<cr>", { desc = "Telescope Undo" })

-- UI
map("n", "<leader>um", "<cmd>TableModeToggle<cr>", { desc = "Table Mode Toggle" })

-- Distant
map("n", "<leader>Dlj", "<cmd>DistantConnect ssh://10.10.10.142<cr>", { desc = "Joyent Mac" })
map("n", "<leader>Dlm", "<cmd>DistantConnect ssh://mail.dabuke.com<cr>", { desc = "Mail.dabuke.com" })
map("n", "<leader>Dll", "<cmd>DistantConnect ssh://l2.dabuke.com<cr>", { desc = "l2.dabuke.com" })
map("n", "<leader>DM", "<cmd>DistantMetadata<CR>", { desc = "Distant Metadata" })
map("n", "<leader>DR", "<cmd>DistantRemove<CR>", { desc = "Distant Remove" })
map("n", "<leader>DS", "<cmd>DistantShell<CR>", { desc = "Distant Shell" })
map("n", "<leader>D/", "<cmd>DistantSearch<CR>", { desc = "Distant Search" })
map("n", "<leader>DD", "<cmd>Distant<CR>", { desc = "Distant Search" })
map("n", "<leader>Dc", "<cmd>DistantCopy<CR>", { desc = "Distant Copy" })
map("n", "<leader>Di", "<cmd>DistantInstall<CR>", { desc = "Distant Install" })
map("n", "<leader>Dm", "<cmd>DistantMkdir<CR>", { desc = "Distant Mkdir" })
map("n", "<leader>Dr", "<cmd>DistantRename<CR>", { desc = "Distant Rename" })
map("n", "<leader>Dw", "<cmd>DistantSpawn<CR>", { desc = "Distant Spawn" })
map("n", "<leader>Dx", "<cmd>DistantRun<CR>", { desc = "Distant Run" })
map("n", "<leader>Dz", "<cmd>DistantCancelSearch<CR>", { desc = "Distant Cancels Search " })
map("n", "<leader>DIs", "<cmd>DistantSystemInfo<CR>", { desc = "Distant System Info" })
map("n", "<leader>DIS", "<cmd>DistantSessionInfo<CR>", { desc = "Distant Session Info" })
map("n", "<leader>DIC", "<cmd>DistantCheckHealth<CR>", { desc = "Distant Check Health " })
map("n", "<leader>DIz", "<cmd>DistantClientVersion<CR>", { desc = "Distant Client Version " })
