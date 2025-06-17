--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

----------------------------------------------------------------------

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

----------------------------------------------------------------------
--                           Quick Escape                           --
----------------------------------------------------------------------

vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("i", "jk", "<ESC>", { silent = true })
vim.keymap.set("i", "kj", "<ESC>", { silent = true })

----------------------------------------------------------------------
--                           Quit Quickly                           --
----------------------------------------------------------------------

vim.keymap.set({ "n", "v", "i" }, "<M-q>", "<cmd>qa<cr>", { desc = "[P]Quit All" })

----------------------------------------------------------------------
--                   Snippet Jump in insert mode                    --
----------------------------------------------------------------------

vim.keymap.set({ "i", "s" }, "<C-j>", function()
    vim.snippet.jump(1)
end)
vim.keymap.set({ "i", "s" }, "<C-k>", function()
    vim.snippet.jump(-1)
end)

----------------------------------------------------------------------
--                Start Peek for the current session                --
----------------------------------------------------------------------

vim.keymap.set("n", "<F3>", "<cmd>PeekOpen<cr>", { desc = "Peek Open" })

----------------------------------------------------------------------
--                               oil                                --
----------------------------------------------------------------------

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "OIL open parent" })

----------------------------------------------------------------------
--                          reload keymaps                          --
----------------------------------------------------------------------

vim.keymap.set(
    "n",
    "<leader>Rk",
    "<cmd>source ~/.config/nvim/lua/config/keymaps.lua<cr>",
    { desc = "Reload keymaps.lua" }
)

----------------------------------------------------------------------
--                         reload snippets                          --
----------------------------------------------------------------------

vim.keymap.set(
    "n",
    "<leader>Rs",
    "<cmd>source ~/.config/nvim/after/plugin/snippets.lua<cr>",
    { desc = "Reload luasnip.lua" }
)

----------------------------------------------------------------------
--            Which-key  Alt-K top level keymaps display            --
----------------------------------------------------------------------

vim.api.nvim_set_keymap("n", "<M-k>", "<cmd>WhichKey<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-k>", "<cmd>WhichKey<space>v<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<cmd>WhichKey<space>i<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<M-k>", "<cmd>WhichKey<space>c<cr>", { noremap = true, silent = true })

-- movement
vim.keymap.set({ 'n', 'v' }, 'gk', '<cmd>Treewalker Up<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'gj', '<cmd>Treewalker Down<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'gh', '<cmd>Treewalker Left<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'gl', '<cmd>Treewalker Right<cr>', { silent = true })

-- swapping
vim.keymap.set('n', 'gK', '<cmd>Treewalker SwapUp<cr>', { silent = true })
vim.keymap.set('n', 'gJ', '<cmd>Treewalker SwapDown<cr>', { silent = true })
vim.keymap.set('n', 'gH', '<cmd>Treewalker SwapLeft<cr>', { silent = true })
vim.keymap.set('n', 'gL', '<cmd>Treewalker SwapRight<cr>', { silent = true })

----------------------------------------------------------------------
--                          Comment Block                           --
----------------------------------------------------------------------

vim.api.nvim_set_keymap('n', 'gcb', ":lua require('nvim-comment-frame').add_comment()<CR>", { desc = "Comment Block Add", noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gcC', ":lua require('nvim-comment-frame').add_multiline_comment()<CR>", { desc = "Comment Multi Block", noremap = true, silent = true })

----------------------------------------------------------------------
--                    Which-Key Top level labels                    --
----------------------------------------------------------------------

local wk = require("which-key")
wk.add({
    { "<leader>n", group = "+Notes"},
    { "<leader>R", group = "+Reload"},
    -- { "<leader>nz", group = "+ZK"},
    { "<leader>T", group = "+Checkmate"},
    { "<leader>o", group = "+Org-Mode"},
    { "<leader>ob", group = "+Org-Babel"},
    { "<leader>od", group = "+Org Date"},
    { "<leader>oi", group = "+Org Insert"},
    { "<leader>ol", group = "+Org Link"},
    { "<leader>on", group = "+Org Note"},
    { "<leader>ox", group = "+Org Misc"},
})

local map = LazyVim.safe_keymap_set

----------------------------------------------------------------------
--                       Leader Based Keymaps                       --
----------------------------------------------------------------------


----------------------------------------------------------------------
--                               TAB                                --
----------------------------------------------------------------------

map("n", "<leader><tab><tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })

----------------------------------------------------------------------
--                          Tmux Navigate                           --
----------------------------------------------------------------------

map("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Tmux Down" })
map("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<cr>", { desc = "Tmux Last Active" })
map("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>", { desc = "Tmux Next" })


----------------------------------------------------------------------
--                         code insertions                          --
----------------------------------------------------------------------

map("n", "<leader>cj", "<cmd>lua require('jq').run()<cr>", { desc = "JQ Interface" })


----------------------------------------------------------------------
--                                D                                 --
----------------------------------------------------------------------

map("n", "<leader>dd", '"_d', { desc = 'Delete to the void register'})
map("n", "<leader>dj", "<CMD>Oil<CR>", { desc = "DIRED Jump binding alias to OIL" })

----------------------------------------------------------------------
--                               File                               --
----------------------------------------------------------------------

map("n", "<leader>fo", "<cmd>FuzzyOil<cr>", { desc = "Fuzzy Oil" })
map("n", "<leader>fs", "<cmd>up<cr>", { desc = "File Save" })
map("n", "<leader>fS", "<cmd>w !sudo tee %<CR>", { desc = "Sudo Write" })

----------------------------------------------------------------------
--                               GIT                                --
----------------------------------------------------------------------

map("n", "<leader>gT", "<cmd>Tardis<cr>", { desc = "Tardis (TimeMachine)" })
map("n", "<leader>gm", "<cmd>GitMessenger<cr>", { desc = "Git Messenger" })
map("n", "<leader>gz", "<cmd>Telescope git_branches<cr>", { desc = "Git Branches" })
map("n", "<leader>gv",  function()
    if next(require('diffview.lib').views) == nil then
        vim.cmd('DiffviewOpen')
    else
        vim.cmd('DiffviewClose')
    end
end, { desc = "Git DiffView" })
map("n", "<leader>gg", function()
    require("lazygit-confirm").confirm()
end, { noremap = true, desc = "LazyGit /w confirm"})

    ----------------------------------------------------------------------
    --                    My Open Functions keymaps                     --
    ----------------------------------------------------------------------

map('n', '<leader>mm', function()
    vim.cmd('write')
    local input = vim.fn.expand('%:p')
    local output = vim.fn.expand('%:p:r') .. '.md'
    vim.cmd('!pandoc "' .. input .. '" -f org -t markdown -o "' .. output .. '"')
end, { desc = "Convert Org to Markdown with Pandoc" })

----------------------------------------------------------------------
--                              Notes                               --
----------------------------------------------------------------------
-- map("n", "<leader>nzoi", "<cmd>e ~/Zettelkasten/Inbox/inbox.md<cr>", { desc = "Open INBOX" })
-- map("n", "<leader>nzog", "<cmd>e ~/Zettelkasten/Inbox/tasks.md<cr>", { desc = "Open Tasks" })
--
-- map("n", "<leader>nzI", "<Cmd>ZkIndex<CR>", { desc = "ZK index" })
-- map("n", "<leader>nzN", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", { desc = "ZK New" })
-- map("n", "<leader>nzb", "<Cmd>ZkBacklinks<CR>", { desc = "ZK Backlinks" })
-- map("n", "<leader>nzc", "<Cmd>ZkCd<CR>", { desc = "ZK cd" })
-- map("n", "<leader>nzi", "<Cmd>ZkInsertLink<CR>", { desc = "ZK Insert Link" })
-- map("n", "<leader>nzl", "<Cmd>ZkLinks<CR>", { desc = "ZK Links" })
-- map("n", "<leader>nzr", "<Cmd>ZkNotes { createdAfter = '3 days ago' }<CR>", { desc = "ZK Recent" })
-- map("n", "<leader>nzt", "<Cmd>ZkTags<CR>", { desc = "ZK Tags" })
-- map("n", "<leader>nzz", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", { desc = "ZK Notes" })
--
-- -- Key map from copilot. son of a bitch. it worked.
-- vim.keymap.set("n", "<leader>nzj", function()
--     local file = vim.fn.system("daily-file.sh")
--     file = vim.fn.trim(file) -- Remove any trailing newline characters
--     if vim.fn.filereadable(file) == 1 then
--         vim.cmd("edit " .. file)
--     else
--         print("File not found: " .. file)
--         require("zk.commands").get("ZkNew")({ dir = "journals" })
--     end
-- end, { desc = "Open file from script" })
--
-- map("v", "<leader>nzf", "<Cmd>:'<,'>ZkMatch<CR>", { desc = "ZK Match" })
-- map("v", "<leader>nzi", "<Cmd>:'<,'>ZkInsertLinkAtSelection<CR>", { desc = "ZK Insert Link" })
-- map("v", "<leader>nzN", "<Cmd>'<,'>ZkNewFromTitleSelection<CR>", { desc = "ZK New" })
--
-- map("n", "<leader>nh", function() Snacks.picker.notifications() end, { desc = "Notification History" })
-- map("n", "<leader>fP", function() Snacks.picker.projects() end, { desc = "Projects" })
--
----------------------------------------------------------------------
--                         Search Telescope                         --
----------------------------------------------------------------------

map("n", "<leader>sf", "<cmd>Telescope filetypes<cr>", { desc = "Search Filetype" })
map("n", "<leader>sN", "<cmd>Telescope nerdy<cr>", { desc = "Search Nerdy" })

----------------------------------------------------------------------
--                                UI                                --
----------------------------------------------------------------------

map("n", "<leader>uM", "<cmd>TableModeToggle<cr>", { desc = "Toggle Table Mode" })
map("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss All Notification" })
map("n", "<leader>uB", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Git Blame" })


local query=vim.treesitter.query.parse('markdown','((atx_heading) @header)')
vim.keymap.set('n',']h',function ()
    local root=vim.treesitter.get_parser():parse()[1]:root()
    local _,node,_=query:iter_captures(root,0,vim.fn.line'.',-1)()
    if not node then return end
    require'nvim-treesitter.ts_utils'.goto_node(node)
end)
-- EOF



