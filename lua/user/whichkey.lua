local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 10, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["/"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },

  ["a"] = {
    name = "+application",
    a = { "<cmd>Alpha<cr>", "Alpha" },
  },

  ["b"] = {
    name = "+buffers",
    b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers"},
    n = { "<cmd>bNext<cr>", "Next Buffer" },
    p = { "<cmd>bprevious<cr>", "Next Previous" },
  },

  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },

  ["e"] = {
    name = "+edit",
    e = { "<cmd>NvimTreeToggle<cr>", "Neotree Explorer" },
  },

  ["f"] = {
    name = "+file",
    g  = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Telescope git_files"},
    f  = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files"},
    b  = { "<cmd>Telescope file_browser<cr>", "Find files"},
    n  = { "<cmd>ene <BAR> startinseert <CR>", "New File"},
    r  = { "<cmd>RnvimrToggle<CR>", "Ranger" },
    s  = { "<cmd>up<CR>", "Save" },
   },

  ["g"] = {
    name = "Git",
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
  ["t"] = {
    name = "Telescope",
    s = { "<cmd>Telescope git_status<cr>", "Telescope status" },
    b = { "<cmd>Telescope git_branches<cr>", "Telescope branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Telescope commit" },
    B = { "<cmd>Telescope git_bcommits<cr>", "Telescope bcommit" },
    S = { "<cmd>Telescope git_stash<cr>", "Telescop stash" },
    f = { "<cmd>Telescope git_flie<cr>", "Telescope files" },
    },
  },

  ["h"] = {
    name = "+help",
    h = { "<cmd>Telescope help_tags<CR>", "Telescope Help" },
    H = { "<cmd>help<CR>", "Telescope Help" },

    ["b"] = {
      name = "+bindings",
      t = { "<cmd>WhichKey<cr>", "WhichkKey Top Level"},
    },
  },

  ["l"] = {
    name = "LSP",
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics", },
    f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic", },
    k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    t = {"<cmd>Telescope ToggleLSP<cr>", "LSP" },
    w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics", },
  },

  ["o"] = {
    name = "+open",
    m = {
      name = "+my",
      ["0"] = { "<cmd>edit $HOME/Nextcloud/vimwiki/QuickNote.md<cr>", "Inbox file" },
      g = { "<cmd>edit $HOME/Nextcloud/vimwiki/tasks.md<cr>", "Open My Task" },
      j = { "<cmd>edit $HOME/Nextcloud/vimwiki/joyent/index.md<cr>", "Open My Task" },
      G = { "<cmd>edit $HOME/Nextcloud/vimwiki/joyent/gage/index.md", "Open Gage" },
    },
  },

  ["p"] = { 
    name = "+project",
    p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    s = { "<cmd>Telescope live_grep<cr>", "Projects" },
  },

  P = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  ["q"] = { "<cmd>q!<CR>", "Quit" },

  ["s"] = {
    name = "+search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  ["T"] = {
    name = "+telescope",
    a = {"<cmd>Telescope autocommands<cr>", "autoommands" },
    c = {"<cmd>Telescope commands<cr>", "Commands" },
    C = {"<cmd>Telescope command_history<cr>", "Command History" },
    e = {"<cmd>Telescope env<cr>", "Environment" },
    f = {"<cmd>Telescope find_pickers<cr>", "list pickers" },
    F = {"<cmd>Telescope filetypes<cr>", "filetypes" },
    g = {"<cmd>Telescope glyph<cr>", "Glyph" },
    l = {"<cmd>Telescope luasnip<cr>", "luasnip" },
    m = {"<cmd>Telescope marks<cr>", "Marks" },
    M = {"<cmd>Telescope Man_pages<cr>", "Man Pages" },
    p = {"<cmd>Telescope packer<cr>", "Packer" },
    t = {"<cmd>Telescope<cr>", "Telescope" },
    v = {"<cmd>Telescope vim_options<cr>", "Vim Options" },
    z = {"<cmd>Telescope zoxide list<cr>", "Zoxide" },
  },

  ["t"] = {
    name = "+terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  ["z"] = {
    name = "+telekasten",
    b = { "<cmd>lua require('telekasten').show_backlinks()<CR>", "Backlinks" },
    c = { "<cmd>lua require('telekasten').show_calendar()<CR>", "Show Calendar" },
    d = { "<cmd>lua require('telekasten').find_daily_notes()<CR>", "Find Daily Notes" },
    f = { "<cmd>lua require('telekasten').find_notes()<CR>", "Find Notes" },
    g = { "<cmd>lua require('telekasten').search_notes()<CR>", "Search Notes" },
    l = { "<cmd>lua require('telekasten').follow_link()<CR>", "Follow Link" },
    n = { "<cmd>lua require('telekasten').new_note()<CR>", "New Note" },
    t = { "<cmd>lua require('telekasten').goto_today()<CR>", "Today" },
    z = { "<cmd>lua require('telekasten').panel()<CR>", "Panel" },
  },

}

which_key.setup(setup)
which_key.register(mappings, opts)
