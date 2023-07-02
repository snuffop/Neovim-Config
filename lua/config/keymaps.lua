-- Keymaps are automatically loaded on the VeryLazy event
--   Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set('n', "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set('n', "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set('n', "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set('n', "<C-l>", "<cmd>TmuxNavigateRight<cr>")

vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- dunno how to get working in whichkey

-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
--
-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)
--
-- -- greatest remap ever
--
-- -- next greatest remap ever : asbjornHaland
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
--
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
--
-- -- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")
--
-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
--
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--
--
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
--
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

-- Whichkey additions 

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "Tab New " })
map("n", "<leader><tab><tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

local wk = require("which-key")
local wkopts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {

  ["a"] = {
    name = "+Application",
    m = {
      name = "+markdown",
      m = { "<cmd>MarkdownPreview<cr>", "Preview"},
      s = { "<cmd>MarkdownPreviewStop<cr>", "Preview Stop"},
      t = { "<cmd>MarkdownPreviewToggle<cr>", "Preview Toggle"},
    },
  },

  ["b"] = {
    name = "+Buffers",
    l = { ":lua require('telescope.builtin').buffers()<cr>", "List" },
  },

  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Nvim Tree" },

  ["f"] = {
    s = { "<cmd>up<cr><esc>", "Save File" },
    a = { "<cmd>RnvimrToggle<cr>", "Ranger Vim" },
    e = { "<cmd>NvimTreeToggle<cr>", "Nvim Tree" },
    z = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
  },

  ["g"] = {
    f = { "<cmd>Git<cr>", "Fugative Git Status" },
    n = { "<cmd>Neogit<cr>", "Neogit" },
    m = { "<cmd>MergetoolToggle<cr>", "Mergetool" },
  },

  ["h"] = {
    name = " Harpoon",
    m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file" },
    t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
    a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
    s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
    d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
    f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
    g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
    q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
    w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
    e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
    r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
    n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
    p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
  },

  ["n"] = {
    o = {
      name = "Obsidian",
      C = { "<cmd>ObsidianCheckHealth<cr>", "Check Health" },
      T = { "<cmd>ObsidianTomorrow<cr>", "Tomorrow" },
      b = { "<cmd>ObsidianBacklinks<cr>", "Backlinks" },
      c = { "<cmd>ObsidianCheck<cr>", "Check" },
      f = { "<cmd>ObsidianFollowLink<cr>", "Follow Link" },
      l = { "<cmd>ObsidianLink<cr>", "Link" },
      n = { "<cmd>ObsidianNew<cr>", "New Note" },
      o = { "<cmd>ObsidianOpen<cr>", "Open" },
      q = { "<cmd>ObsidianQuickSwitch<cr>", "Quick Switch" },
      s = { "<cmd>ObsidianSearch<cr>", "Search" },
      t = { "<cmd>ObsidianToday<cr>", "Today" },
      y = { "<cmd>ObsidianYesterday<cr>", "Yesterday" },
    },
  },

  ["p"] = {
    name = "+Project",
    f = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Project Fils" },
    p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  },

  ["s"] = {
    e = { "<cmd>Telescope env<cr>", "Environment" },
    f = { "<cmd>Telescope find_pickers<cr>", "list pickers" },
    F = { "<cmd>Telescope filetypes<cr>", "filetypes" },
    y = { "<cmd>Telescope glyph<cr>", "Glyph" },
  },

  ["w"] = {
    h = { '<C-w>|', 'Maximize window horizontally (|)' },
    v = { '<C-w>_', 'Maximize window vertically (_)' },
    ['='] = { '<C-w>=', 'Resize windows equally' },
    s = { ":lua require('telescope-tabs').list_tabs()<cr>", 'Search Tabs' },
  },

  ["x"] = {
    c = { "<cmd>!chmod +x %<CR>", "chmod" },
  },
}

wk.register(mappings, wkopts)
