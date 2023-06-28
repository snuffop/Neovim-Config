-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local wk = require("which-key")
local wkopts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
        local nvim_tmux_nav = require('nvim-tmux-navigation')

        nvim_tmux_nav.setup {
            disable_when_zoomed = true -- defaults to false
        }
vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)


local mappings = {

  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Nvim Tree" },

  ["f"] = {
    s = { "<cmd>up<cr><esc>", "Save File" },
    a = { "<cmd>RnvimrToggle<cr>", "Ranger Vim" },
    e = { "<cmd>NvimTreeToggle<cr>", "Nvim Tree" },
  },

  ["g"] = {
    f = { "<cmd>Git<cr>", "Fugative Git Status" },
  },

  ["h"] = {
    name = "+help",
    h = { "<cmd>Telescope help_tags<CR>", "Telescope Help" },
    H = { "<cmd>help<CR>", "Telescope Help" },
    ["b"] = {
      name = "+bindings",
      t = { "<cmd>WhichKey<cr>", "WhichkKey Top Level" },
    },
  },

  ["n"] = {
    name = "Notes/Neorg",
    N = { "<cmd>Neorg keybind norg core.dirman.new.note<cr>", "New Note" },
    U = { "<cmd>Neorg upgrade current-directory<cr>", "[U]pgrades Current Directory" },
    l = { "<cmd>Telescope neorg find_linkable<cr>", "Linkable Notes" },
    n = { "<cmd>Telescope neorg find_norg_files<cr>", "Find Notes" },
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
    r = { "<cmd>Neorg return<cr>", "Neorg Return" },
    t = { "<cmd>Neorg tangle current-file<cr>", "[T]angle Code to file" },
    u = { "<cmd>Neorg upgrade current-file<cr>", "[U]pgrades Current File" },
    w = { "<cmd>Telescope neorg switch_workspace<cr>", "Switch Workspace" },
    j = {
      name = "journal",
      j = { "<cmd>Neorg journal today<cr>", "Today's [j]ournal" },
      t = { "<cmd>Neorg journal tomorrow<cr>", "[t]omorrow's Journal" },
      y = { "<cmd>Neorg journal yesterday<cr>", "[y]esterday's Journal" },
      T = { "<cmd>Neorg journal template<cr>", "[T]emplate Journal" },
      c = { "<cmd>Neorg journal custom<cr>", "[C]ustom Journal" },
    },
  },

  ["o"] = {
    name = "+open",
    m = {
      name = "+my",
      ["0"] = { "<cmd>edit $HOME/Nextcloud/Notes/org/orgzly/0mobile.org<cr>", "Orgzly Inbox file" },
      j = { "<cmd>edit $HOME/Nextcloud/Joyent/index.norg<cr>", "Open My Task" },
      G = { "<cmd>edit $HOME/Nextcloud/Joyent/Gage/index.norg<cr>", "Open Gage" },
    },
  },

  ["p"] = {
    name = "+project",
    p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    s = { "<cmd>Telescope live_grep<cr>", "Projects" },
  },

  ["s"] = {
    x = { "<cmd>lua require('telescope.builtin').resume<cr>", "resume" },
  },

  ["t"] = {
    name = "+telescope",
    a = { "<cmd>Telescope autocommands<cr>", "autoommands" },
    c = {
      name = "+command",
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      h = { "<cmd>Telescope command_history<cr>", "Command History" },
    },
    e = { "<cmd>Telescope env<cr>", "Environment" },
    f = { "<cmd>Telescope find_pickers<cr>", "list pickers" },
    F = { "<cmd>Telescope filetypes<cr>", "filetypes" },
    g = { "<cmd>Telescope glyph<cr>", "Glyph" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    M = { "<cmd>Telescope Man_pages<cr>", "Man Pages" },
    t = { "<cmd>Telescope<cr>", "Telescope" },
    v = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
    z = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
  },
}

wk.register(mappings, wkopts)
