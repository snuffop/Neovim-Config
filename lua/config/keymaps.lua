local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local wkopts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local wk = require("which-key")

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Save
keymap("n", "<C-s>", ":up<CR>", opts)
keymap("i", "<C-s>", "<ESC>:up<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

local mappings = {

  ["/"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },

  ["a"] = {
    name = "+application",
    a = { "<cmd>Alpha<cr>", "Alpha" },
  },

  ["b"] = {
    name = "+buffers",
    W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
    p = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
    b = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
  },

 -------------------------------------------------------------------------------- 
  -- E -- 
 -------------------------------------------------------------------------------- 
  ["e"] = {
    name = "+edit",
    e = { "<cmd>NvimTreeToggle<cr>", "Neotree Explorer" },
  },

 -------------------------------------------------------------------------------- 
  -- F -- 
 -------------------------------------------------------------------------------- 
  ["f"] = {
    name = "+file",
    g  = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Telescope git_files"},
    f  = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files"},
    b  = { "<cmd>Telescope file_browser<cr>", "Find files"},
    N  = { "<cmd>ene <BAR> startinseert <CR>", "New File"},
    r  = { "<cmd>RnvimrToggle<CR>", "Ranger" },
    s  = { "<cmd>up<CR>", "Save" },
   },

 -------------------------------------------------------------------------------- 
  -- G -- 
 -------------------------------------------------------------------------------- 
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

 -------------------------------------------------------------------------------- 
  -- T -- 
 -------------------------------------------------------------------------------- 
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

 -------------------------------------------------------------------------------- 
  -- H -- 
 -------------------------------------------------------------------------------- 
  ["h"] = {
    name = "+help",
    h = { "<cmd>Telescope help_tags<CR>", "Telescope Help" },
    H = { "<cmd>help<CR>", "Telescope Help" },

    ["b"] = {
      name = "+bindings",
      t = { "<cmd>WhichKey<cr>", "WhichkKey Top Level"},
    },
  },

 -------------------------------------------------------------------------------- 
  -- L -- 
 -------------------------------------------------------------------------------- 
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
    T = {"<cmd>Telescope ToggleLSP<cr>", "LSP" },
    w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics", },
    ["t"] = {
      name = "+trouble",
      t = { "<cmd>TroubleToggle<cr>", "trouble" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
      l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
      r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
    },
  },


 -------------------------------------------------------------------------------- 
  -- O -- 
 -------------------------------------------------------------------------------- 
  ["o"] = {
    name = "+open",
    m = {
      name = "+my",
      ["0"] = { "<cmd>edit $HOME/Nextcloud/zk/0INBOX.md<cr>", "Inbox file" },
      q = { "<cmd>edit $HOME/Nextcloud/zk/QuickNote.md<cr>", "Inbox file" },
      j = { "<cmd>edit $HOME/Nextcloud/zk/joyent/index.md<cr>", "Open My Task" },
      G = { "<cmd>edit $HOME/Nextcloud/zk/joyent/gage/index.md", "Open Gage" },
    },
  },

 -------------------------------------------------------------------------------- 
  -- P -- 
 -------------------------------------------------------------------------------- 
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

 -------------------------------------------------------------------------------- 
  -- Q -- 
 -------------------------------------------------------------------------------- 
  ["q"] = { "<cmd>q!<CR>", "Quit" },

 -------------------------------------------------------------------------------- 
  -- R -- 
 -------------------------------------------------------------------------------- 

 -------------------------------------------------------------------------------- 
  -- S -- 
 -------------------------------------------------------------------------------- 
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

 -------------------------------------------------------------------------------- 
  -- T -- 
 -------------------------------------------------------------------------------- 
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
    name = "+terminal / +toggle",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    s = { "<cmd>lua vim.opt.spell = not(vim.opt.spell:get())<cr>", "Toggle Spelling" },

  },

 -------------------------------------------------------------------------------- 
  -- z -- 
 -------------------------------------------------------------------------------- 
  ["z"] = {
    name = "+Zettelkasten",
    n = { "<cmd>ZkNew<CR>", "New note" },
    z = { "<cmd>ZkNotes<CR>", "Search notes" },
    b = { "<cmd>ZkBacklinks<CR>", "Backlinks" },
    l = { "<cmd>ZkLinks<CR>", "Pick link" },
    t = { "<cmd>ZkTags<CR>", "Tags" },
  },
}

wk.register(mappings, wkopts)

 -------------------------------------------------------------------------------- 
  -- end which-key mappings -- 
 -------------------------------------------------------------------------------- 

local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<C-s>", "core.integrations.telescope.find_linkable" },
        },

        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)
  

