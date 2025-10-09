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
vim.keymap.set({ "n", "v" }, "gk", "<cmd>Treewalker Up<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "gj", "<cmd>Treewalker Down<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "gh", "<cmd>Treewalker Left<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "gl", "<cmd>Treewalker Right<cr>", { silent = true })

-- swapping
vim.keymap.set("n", "gK", "<cmd>Treewalker SwapUp<cr>", { silent = true })
vim.keymap.set("n", "gJ", "<cmd>Treewalker SwapDown<cr>", { silent = true })
vim.keymap.set("n", "gH", "<cmd>Treewalker SwapLeft<cr>", { silent = true })
vim.keymap.set("n", "gL", "<cmd>Treewalker SwapRight<cr>", { silent = true })

----------------------------------------------------------------------
--                          Comment Block                           --
----------------------------------------------------------------------

vim.api.nvim_set_keymap(
  "n",
  "gcb",
  ":lua require('nvim-comment-frame').add_comment()<CR>",
  { desc = "Comment Block Add", noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "gcC",
  ":lua require('nvim-comment-frame').add_multiline_comment()<CR>",
  { desc = "Comment Multi Block", noremap = true, silent = true }
)

----------------------------------------------------------------------
--                    Which-Key Top level labels                    --
----------------------------------------------------------------------

local wk = require("which-key")
wk.add({
  { "<leader>R", group = "+Reload" },
  { "<leader>T", group = "+Checkmate" },
  { "<leader>p", group = "+Projects" },
  { "<leader>z", group = "+ZK" },
  { "<leader>zn", group = "+ZK New" },
  { "<leader>z<space>", group = "+ZK Dailies" },
})

local map = LazyVim.safe_keymap_set

----------------------------------------------------------------------
--                               TAB                                --
----------------------------------------------------------------------

map("n", "<leader><tab><tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })

----------------------------------------------------------------------
--                         code insertions                          --
----------------------------------------------------------------------

map("n", "<leader>cj", "<cmd>lua require('jq').run()<cr>", { desc = "JQ Interface" })

----------------------------------------------------------------------
--                                D                                 --
----------------------------------------------------------------------

map("n", "<leader>dd", '"_d', { desc = "Delete to the void register" })
map("n", "<leader>dj", "<CMD>Oil<CR>", { desc = "DIRED Jump binding alias to OIL" })

----------------------------------------------------------------------
--                               File                               --
----------------------------------------------------------------------

map("n", "<leader>fo", "<cmd>FuzzyOil<cr>", { desc = "Fuzzy Oil" })
map("n", "<leader>fs", "<cmd>up<cr>", { desc = "File Save" })
map("n", "<leader>fS", "<cmd>w !sudo tee %<CR>", { desc = "Sudo Write" })

-- Copy Path
vim.keymap.set("n", "<leader>fC", function()
  local path = vim.api.nvim_buf_get_name(0)
  vim.fn.setreg("+", path) -- copy to system clipboard
  print("Copied: " .. path)
end, { desc = "Copy file path" })

----------------------------------------------------------------------
--                               GIT                                --
----------------------------------------------------------------------

map("n", "<leader>gT", "<cmd>Tardis<cr>", { desc = "Tardis (TimeMachine)" })
map("n", "<leader>gm", "<cmd>GitMessenger<cr>", { desc = "Git Messenger" })
map("n", "<leader>gz", "<cmd>Telescope git_branches<cr>", { desc = "Git Branches" })
map("n", "<leader>gv", function()
  if next(require("diffview.lib").views) == nil then
    vim.cmd("DiffviewOpen")
  else
    vim.cmd("DiffviewClose")
  end
end, { desc = "Git DiffView" })
map("n", "<leader>gg", function()
  require("lazygit-confirm").confirm()
end, { noremap = true, desc = "LazyGit /w confirm" })

----------------------------------------------------------------------
--                    My Open Functions keymaps                     --
----------------------------------------------------------------------

map("n", "<leader>mm", function()
  vim.cmd("write")
  local input = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r") .. ".md"
  vim.cmd('!pandoc "' .. input .. '" -f org -t markdown -o "' .. output .. '"')
end, { desc = "Convert Org to Markdown with Pandoc" })


----------------------------------------------------------------------
--                                UI                                --
----------------------------------------------------------------------

map("n", "<leader>un", function()
  Snacks.notifier.hide()
end, { desc = "Dismiss All Notification" })
map("n", "<leader>uB", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Git Blame" })

-- Check if Marksman LSP is running, start it if not, otherwise restart lamw26wmal
vim.keymap.set("n", "<leader>uR", function()
  local is_running = false
  for _, client in ipairs(vim.lsp.get_clients()) do
    if client.name == "marksman" then
      is_running = true
      break
    end
  end
  if is_running then
    vim.cmd("LspRestart marksman")
    vim.notify("Marksman LSP restarted", vim.log.levels.INFO)
  else
    vim.cmd("LspStart marksman")
    vim.notify("Marksman LSP started", vim.log.levels.INFO)
  end
end, { desc = "[P]Start/Restart Marksman LSP" })

local query = vim.treesitter.query.parse("markdown", "((atx_heading) @header)")
vim.keymap.set("n", "]h", function()
  local root = vim.treesitter.get_parser():parse()[1]:root()
  local _, node, _ = query:iter_captures(root, 0, vim.fn.line("."), -1)()
  if not node then
    return
  end
  require("nvim-treesitter.ts_utils").goto_node(node)
end)

-- EOF
