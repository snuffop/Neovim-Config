--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

----------------------------------------------------------------------
--              Move blocks of visually selected text               --
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

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

----------------------------------------------------------------------
--                          reload keymaps                          --
----------------------------------------------------------------------

vim.keymap.set(
    "n",
    "<leader><leader>k",
    "<cmd>source ~/.config/nvim/lua/config/keymaps.lua<cr>",
    { desc = "Reload keymaps.lua" }
)

----------------------------------------------------------------------
--                         reload snippets                          --
----------------------------------------------------------------------

vim.keymap.set(
    "n",
    "<leader><leader>s",
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
    -- { "<leader>e", group = "+Ecolog" },
    { "<leader>n", group = "+Notes"},
    { "<leader>o", group = "+Org Mode"},
    { "<leader>nb", group = "+Bridge"},
    { "<leader>nd", group = "+Dailies"},
    { "<leader>no", group = "+Open"},
    { "<leader>nz", group = "+ZK"},
})

local map = LazyVim.safe_keymap_set

----------------------------------------------------------------------
--                           Leader Maps                            --
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
--                              Buffer                              --
----------------------------------------------------------------------

map("n", "<leader>bB", "<cmd>Telescope buffers<cr>", { desc = "Telescope Buffers" })

----------------------------------------------------------------------
--                         code insertions                          --
----------------------------------------------------------------------

map("n", "<leader>cj", "<cmd>lua require('jq').run()<cr>", { desc = "JQ Interface" })

----------------------------------------------------------------------
--                                D                                 --
----------------------------------------------------------------------

map("n", "<leader>dd", '"_d', { desc = 'Delete to the void register'})

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
map("n", "<leader>gg", function() require("lazygit-confirm").confirm() end, { desc = "Git Confirm" })


----------------------------------------------------------------------
--                              Notes                               --
----------------------------------------------------------------------

map("n", "<leader>noi", "<cmd>e ~/Zettelkasten/Inbox/inbox.md<cr>", { desc = "Open INBOX" })
map("n", "<leader>nog", "<cmd>e ~/Zettelkasten/Inbox/tasks.md<cr>", { desc = "Open Tasks" })

----------------------------------------------------------------------
--                                ZK                                --
----------------------------------------------------------------------

map("n", "<leader>nzI", "<Cmd>ZkIndex<CR>", { desc = "ZK index" })
map("n", "<leader>nzN", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", { desc = "ZK New" })
map("n", "<leader>nzb", "<Cmd>ZkBacklinks<CR>", { desc = "ZK Backlinks" })
map("n", "<leader>nzc", "<Cmd>ZkCd<CR>", { desc = "ZK cd" })
map("n", "<leader>nzi", "<Cmd>ZkInsertLink<CR>", { desc = "ZK Insert Link" })
map("n", "<leader>nzj", "<Cmd>! daily-file.sh<CR>", { desc = "ZK Daily Journal" })
map("n", "<leader>nzl", "<Cmd>ZkLinks<CR>", { desc = "ZK Links" })
map("n", "<leader>nzr", "<Cmd>ZkNotes { createdAfter = '3 days ago' }<CR>", { desc = "ZK Recent" })
map("n", "<leader>nzt", "<Cmd>ZkTags<CR>", { desc = "ZK Tags" })
map("n", "<leader>nzz", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", { desc = "ZK Notes" })

map("v", "<leader>nzf", "<Cmd>:'<,'>ZkMatch<CR>", { desc = "ZK Match" })
map("v", "<leader>nzi", "<Cmd>:'<,'>ZkInsertLinkAtSelection<CR>", { desc = "ZK Insert Link" })
map("v", "<leader>nzN", "<Cmd>'<,'>ZkNewFromTitleSelection<CR>", { desc = "ZK New" })

----------------------------------------------------------------------
--                         Search Telescope                         --
----------------------------------------------------------------------

map("n", "<leader>sp", "<cmd>Telescope projects<cr>", { desc = "Search projects" })
map("n", "<leader>sf", "<cmd>Telescope filetypes<cr>", { desc = "Search Filetype" })
map("n", "<leader>sN", "<cmd>Telescope nerdy<cr>", { desc = "Search Nerdy" })

----------------------------------------------------------------------
--                                UI                                --
----------------------------------------------------------------------

map("n", "<leader>uM", "<cmd>TableModeToggle<cr>", { desc = "Toggle Table Mode" })

--EOF 
