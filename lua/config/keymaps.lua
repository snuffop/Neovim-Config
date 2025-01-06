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
--            telescope buffers as I get a file preview,            --
--           that's basically the main benefit lamw25wmal           --
----------------------------------------------------------------------


vim.keymap.set("n", "<S-h>", function()
  require("telescope.builtin").buffers(require("telescope.themes").get_ivy({
    sort_mru = true,
    -- -- Sorts current and last buffer to the top and selects the lastused (default: false)
    -- -- Leave this at false, otherwise when put in normal mode, the buffer
    -- -- below is selected, not the one at the top
    sort_lastused = false,
    initial_mode = "normal",
    -- Pre-select the current buffer
    -- ignore_current_buffer = false,
    -- select_current = true,
    layout_config = {
      -- Set preview width, 0.7 sets it to 70% of the window width
      preview_width = 0.45,
    },
  }))
end, { desc = "[P]Open telescope buffers" })

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
})

local map = LazyVim.safe_keymap_set

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

map("n", "<leader>nL", "<cmd>ObsidianLinkNew<cr>", { desc = "Link New" })
map("n", "<leader>nN", "<cmd>ObsidianNew<cr>", { desc = "New Note" })
map("n", "<leader>nT", "<cmd>ObsidianTemplate<cr>", { desc = "Add Template" })
map("n", "<leader>nbb", "<cmd>ObsidianBacklinks<cr>", { desc = "Find Backlinks" })
map("n", "<leader>nbt", "<cmd>ObsidianBridgeTelescopeCommand<cr>", { desc = "Bridge Telescope" })
map("n", "<leader>nbv", "<cmd>ObsidianBridgeOpenGraph<cr>", { desc = "Bridge Open Graph" })
map("n", "<leader>nbv", "<cmd>ObsidianBridgeOpenVaultMenu<cr>", { desc = "Bridge Vault Menu" })
map("n", "<leader>ndd", "<cmd>ObsidianDailies -30 2<cr>", { desc = "Open Dailies" })
map("n", "<leader>ndt", "<cmd>ObsidianToday<cr>", { desc = "Open Today" })
map("n", "<leader>ndw", "<cmd>ObsidianTomorrow<cr>", { desc = "Open Tomorrow" })
map("n", "<leader>ndy", "<cmd>ObsidianYesterday<cr>", { desc = "Open Yesterday" })
map("n", "<leader>nf", "<cmd>ObsidianFollowLink<cr>", { desc = "Follow Link" })
map("n", "<leader>ng", "<cmd>ObsidianTags<cr>", { desc = "Tags" })
map("n", "<leader>nl", "<cmd>ObsidianLinks<cr>", { desc = "List Links" })
map("n", "<leader>nn", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick Switch" })
map("n", "<leader>no", "<cmd>ObsidianOpen<cr>", { desc = "Open" })
map("n", "<leader>nr", "<cmd>ObsidianRename<cr>", { desc = "Rename" })
map("n", "<leader>ns", "<cmd>ObsidianSearch<cr>", { desc = "Search" })
map("n", "<leader>nt", "<cmd>ObsidianToggleCheckbox<cr>", { desc = "Toggle Checkbox" })
map("n", "<leader>nx", "<cmd>ObsidianExtractNote<cr>", { desc = "Extract Note" })

----------------------------------------------------------------------
--                         Search Telescope                         --
----------------------------------------------------------------------

map("n", "<leader>sp", "<cmd>Telescope projects<cr>", { desc = "Search projects" })
map("n", "<leader>sf", "<cmd>Telescope filetypes<cr>", { desc = "Search Filetype" })
map("n", "<leader>sN", "<cmd>Telescope nerdy<cr>", { desc = "Search Nerdy" })

----------------------------------------------------------------------
--                                UI                                --
----------------------------------------------------------------------

map("n", "<leader>um", "<cmd>TableModeToggle<cr>", { desc = "Toggle Table Mode" })

--EOF 
