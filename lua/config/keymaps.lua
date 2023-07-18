-- Keymaps 

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- vim.keymap.set({"n","i","v"}, "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", opts)

-- TmuxNavigate
vim.keymap.set('n', "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set('n', "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set('n', "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set('n', "<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- Spelling
keymap("n", "<F3>", ":set spell!<CR>", opts)
keymap("i", "<F3>", "<C-O>:set spell!<CR>", opts)

keymap("n", ";w", "<cmd>up<cr>", opts)
keymap("n", ";q", "<cmd>confirm quit<cr>",opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Yank to clipboard
keymap({"n","v"}, "<leader>y", '"+yy', opts)
keymap("n", "<leader>Y", '"+Y', opts)

keymap("n", "<leader>d", '_d', opts)

-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)
keymap("i", "kk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Aditional keymaps
--- Neorg Keybinds
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


-- Whichkey mappings

local wk = require("which-key")

local wkopts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {

    ["/"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },

    a = {
        name = "+Application",
        a = {"<cmd>Alpha<cr>", "Alpha" },
        n = {
            name = "+Noice",
            l = { "<cmd>Noice last<cr>",  "Noice Last Message" },
            h = { "<cmd>Noice history<cr>",  "Noice History" },
            a = { "<cmd>Noice all<cr>",  "Noice All" },
            e = { "<cmd>Noice dismiss<cr>",  "Noice Dismiss All" },
        },
        l = {
            name = "Lazy",
            s = { "<cmd>Lazy sync<cr>", "Sync" },
            i = { "<cmd>Lazy install<cr>", "Install" },
            p = { "<cmd>Telescope lazy<cr>", "Telescope" },
            l = { "<cmd>Lazy<cr>", "Status" },
        },
        t = {
            name  = "+ToDotxt",
            t = { "<cmd>ToDoTxtTasksToggle<cr>", "Toggle Window" },
        }
    },

    b = {
        name = "+Buffers",
        b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers", },
        d = { "<cmd>Bdelete<cr>", "Delete Buffer" },
        l = { ":lua require('telescope.builtin').buffers()<cr>", "List" },
        p = { "<cmd>BufferLineTogglePin<cr>", "Toggle Pin" },
        s = { "<cmd>BufferLinePick<cr>", "Select" },
        w = { "<cmd>Bwipeout<cr>", "Wipeout  Buffer" },
    },

    c = {
        name = "+Code",
        m = { "<cmd>:Mason<cr>", "Mason" },
        i = { "<cmd>:Inspect<cr>", "TS Inspect" },
        I = { "<cmd>:TSInstallInfo<cr>", "TS Install Info" },
    },

    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

    h = { "<cmd>nohlsearch<CR>", "No Highlight" },

    f = {
        name = "+File",
        a = { "<cmd>RnvimrToggle<cr>", "Ranger Vim" },
        b = { "<cmd>Telescope file_browser<cr>", "Telescope file_browser" },
        c = { "<cmd>lua require('telescope.builtin').find_files({cwd = '~/.config/nvim/'})<cr>", "Find Config Files" },
        e = { "<cmd>NvimTreeToggle<cr>", "Nvim Tree" },
        f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files", },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        s = { "<cmd>up<cr><esc>", "Save File" },
        v = { "<cmd>Explore<cr>", "Netrw" },
        z = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
    },


    g = {
        name = "Git",
        L = { "<cmd>LazyGit<cr>", "Lazygit" },
        g = { "<cmd>Neogit<cr>", "Neogit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
        s = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
        t = { "<cmd>lua require('telescope').extensions.lazygit.lazygit()<cr>", "LazyGit Telescope" },
    },

    h = {
        name = "+Help",
        b = {
            name = "Bindings",
            t = { "<cm>WhichKey<cr>", "Whichkey Top Level" },
        }
    },

    l = {
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
        m = { "<cmd>Mason<cr>", "Mason" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics", },
    },

    m = {
        name = "+Harpoon",
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

    n = {
        name = "+Notes",
        n = { "<cmd>Neorg index<cr>", "Neorg Index" },
        r = { "<cmd>Neorg return<cr>", "Neorg Return" },
        c = { "<cmd>Neorg toggle-concealer<cr>", "Neorg concealer toggle" },
        F = { "<cmd>Telescope neorg search_headings<cr>", "Search Headings" },
        f = { "<cmd>Telescope neorg find_linkable<cr>", "Search linkable" },
        j = {
            name = "Neorg Journal",
            j = {"<cmd>Neorg journal today<cr>", "Today" },
            t = {"<cmd>Neorg journal tomorrow<cr>", "Tomorrow" },
            y = {"<cmd>Neorg journal yesterday<cr>", "Yesterday" },
            c = {"<cmd>Neorg journal custom", "Custom" },
            T = {"<cmd>Neorg journal template<cr>", "Template" },
        },
        x  = {
            name = "Neorg tool",
            s = { "<cmd>Neorg generate-workspace-summary<cr>", "Neorg Summary" },
            i = {"<cmd>Neorg inject-metadata<cr>", "Inject Metadata" },
            u = {"<cmd>Neorg update-metadata<cr>", "Update Metadata" },
        },
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
            s = { "<cmd>ObsidianQuickSwitch<cr>", "Quick Switch" },
            g = { "<cmd>ObsidianSearch<cr>", "Search" },
            t = { "<cmd>ObsidianToday<cr>", "Today" },
            y = { "<cmd>ObsidianYesterday<cr>", "Yesterday" },
        },
        t = {
            name = "Toggle",
            c = { "<cmd>Neorg toggle-concealer<cr>", "Toggle Concealer" },
        },
        w = {
            name = "Workspace",
            n = { "<cmd>Neorg workspace notes<cr>", "Notes workspace" },
            j = { "<cmd>Neorg workspace joyent<cr>", "Joyent workspace" },
        },
    },

    o = {
        name = "+Open",
        m = {
            name = "My",
            t = { "<cmd>e ~/Nextcloud/Obsidian/todo/todo.txt<cr>", "Todo Txt"},
            w = { "<cmd>e ~/.config/nvim/after/plugin/whichkey.lua<cr>", "NVIM WhichKey"},
            c = { "<cmd>e ~/.config/nvim/init.lua<cr>", "NVIM Config"},
        },
    },

    p = {
        name = "+projects",
        p = { "<cmd>lua require('telescope').extensions.project.project()<cr>", "Projects" },
        f = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Project files", },
    },

    q = {
        name = "+quit",
        q = {"<cmd>q!<CR>", "Quit" },
    },

    s = {
        name = "Search",
        B = { "<cmd>Telescope builtin<cr>", "Builtin" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        F = { "<cmd>Telescope filetypes<cr>", "filetypes" },
        H = { "<cmd>Telescope highlights<cr>", "highlights" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        e = { "<cmd>Telescope env<cr>", "Environment" },
        f = { "<cmd>Telescope find_pickers<cr>", "list pickers" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        o = { "<cmd>Telescope vim_options<cr>", "Options" },
        r = { "<cmd>Telescope resume<cr>", "Resume" },
        q = { "<cmd>Telescope quickfix<cr>", "Resume" },
        y = { "<cmd>Telescope glyph<cr>", "Glyph" },
    },

    t = {
        name = "Terminal",
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },

    u = { "<cmd>UndotreeToggle<cr>", "undo tree" },

    w = {
        name = "+Windows",
        h = { '<C-w>|', 'Maximize window horizontally (|)' },
        v = { '<C-w>_', 'Maximize window vertically (_)' },
        ['='] = { '<C-w>=', 'Resize windows equally' },
        s = { ":lua require('telescope-tabs').list_tabs()<cr>", 'Search Tabs' },
    },

    x = {
        c = { "<cmd>!chmod +x %<CR>", "chmod" },
    },
}

wk.register(mappings, wkopts)
