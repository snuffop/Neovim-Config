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
map("n", "<leader>fmr", "<cmd>Ranger<cr>", { desc = "Ranger" })
map("n", "<leader>fmn", "<cmd>Nnn<cr>", { desc = "N3" })
map("n", "<leader>fmj", "<cmd>lua require'joshuto'.joshuto()<cr>", { desc = "Joshuto" })
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
map("n", "<leader>noC", "<cmd>ObsidianCheckHealth<cr>", { desc = "Check Health" })
map("n", "<leader>noN", "<cmd>ObsidianLinkNew<cr>", { desc = "Link New" })
map("n", "<leader>noO", "<cmd>ObsidianOpen<cr>", { desc = "Open" })
map("n", "<leader>noT", "<cmd>ObsidianTemplate<cr>", { desc = "Add Template" })
map("n", "<leader>nob", "<cmd>ObsidianBacklinks<cr>", { desc = "Find Backlinks" })
map("n", "<leader>noc", "<cmd>ObsidianCheck<cr>", { desc = "Check" })
map("n", "<leader>nod", "<cmd>ObsidianDailies -30 2<cr>", { desc = "Open Dailies" })
map("n", "<leader>nof", "<cmd>ObsidianFollowLink<cr>", { desc = "Follow Link" })
map("n", "<leader>nog", "<cmd>ObsidianTags<cr>", { desc = "TAGS" })
map("n", "<leader>nol", "<cmd>ObsidianLinks<cr>", { desc = "List Links" })
map("n", "<leader>non", "<cmd>ObsidianNew<cr>", { desc = "New Note" })
map("n", "<leader>noo", "<cmd>ObsidianSearch<cr>", { desc = "Search" })
map("n", "<leader>nos", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick Switch" })
map("n", "<leader>not", "<cmd>ObsidianToday<cr>", { desc = "Open Today" })
map("n", "<leader>now", "<cmd>ObsidianTomorrow<cr>", { desc = "Open Tomorrow" })
map("n", "<leader>nox", "<cmd>ObsidianExtractNote<cr>", { desc = "Extract Note" })
map("n", "<leader>noy", "<cmd>ObsidianYesterday<cr>", { desc = "Open Yesterday" })
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

-- Open

map("n", "<leader>omg", "<cmd>find ~/Nextcloud/Neorg/Todo.norg<cr>", { desc = "Open My Todo's" })
map(
  "n",
  "<leader>omjj",
  "<cmd>find ~/Nextcloud/Obsidian/default/05-Projects/Joyent/20230804T082033==joyent--joyent-notes-index__joyent_index.md<cr>",
  { desc = "Joyent Index" }
)
map(
  "n",
  "<leader>omjs",
  "<cmd>find ~/Nextcloud/Obsidian/default/05-Projects/Joyent/Joyent-Sysops-Index.md<cr>",
  { desc = "Joyent Sysops Index" }
)

-- Project
map("n", "<leader>pp", "<cmd>Telescope projects<cr>", { desc = "Projects" })

--  Search / Telescop4e

map("n", "<leader>sf", "<cmd>Telescope filetypes<cr>", { desc = "Search Filetype" })
map("n", "<leader>sN", "<cmd>Telescope nerdy<cr>", { desc = "Search Nerdy" })

-- Text/Toggle

map("n", "<leader>tu", "<cmd>Telescope undo<cr>", { desc = "Telescope Undo" })

-- UI
map("n", "<leader>um", "<cmd>TableModeToggle<cr>", { desc = "Toggle Table Mode" })
map("n", "<leader>uR", "<cmd>ReaderMode<cr>", { desc = "Toggle ReaderMode" })
