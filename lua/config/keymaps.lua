-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--

vim.keymap.set('n', "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set('n', "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set('n', "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set('n', "<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- Whichkey additions 

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

  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Nvim Tree" },

  ["f"] = {
    s = { "<cmd>up<cr><esc>", "Save File" },
    a = { "<cmd>RnvimrToggle<cr>", "Ranger Vim" },
    e = { "<cmd>NvimTreeToggle<cr>", "Nvim Tree" },
    z = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
    P = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  },

  ["g"] = {
    f = { "<cmd>Git<cr>", "Fugative Git Status" },
    n = { "<cmd>Neogit<cr>", "Neogit" },
    m = { "<cmd>MergetoolToggle<cr>", "Mergetool" },
  },

  ["m"] = {
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
}

wk.register(mappings, wkopts)
