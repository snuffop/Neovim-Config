-- Keymaps 

vim.keymap.set({"i"}, "<C-K>", "<Plug>luasnip-expand-or-jump<cr>", {silent = true})
vim.keymap.set({"i", "s" }, "<C-J>", "<Plug>luasnip-jump-prev<cr>", {silent = true})
vim.keymap.set({"i", "s" }, "<C-L>", "<Plug>luasnip-next-choice<cr>", {silent = true})

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

-- TmuxNavigate
keymap('n', "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
keymap('n', "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts)
keymap('n', "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts)
keymap('n', "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts)

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

vim.cmd([[
nnoremap <M-k> <cmd>WhichKey<cr>
vnoremap <M-k> <cmd>WhichKey '' v<cr>
inoremap <M-k> <cmd>WhichKey '' i<cr>
cnoremap <M-k> <cmd>WhichKey '' c<cr>
]])

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
        m = { "<cmd>Neomutt<cr>", "Neomutt" },
        n = { "<cmd>Nnn<cr>", "Nnn toggle" },
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

    d = {
        name = "+dired",
        j = { "<cmd>Oil<cr>", "Oil Dired Jump" },
    },

    f = {
        name = "+File",
        b = { "<cmd>Telescope file_browser<cr>", "Telescope file_browser" },
        c = { "<cmd>lua require('telescope.builtin').find_files({cwd = '~/.config/nvim/'})<cr>", "Find Config Files" },
        d = { "<cmd>Oil<cr>", "Oil " },
        e = { "<cmd>NvimTreeToggle<cr>", "Nvim-Tree" },
        f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files", },
        g = { "<cmd>Telescope git_files<cr>", "Git File" },
        o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        r = { "<cmd>Ranger<cr>", "Ranger Vim" },
        s = { "<cmd>up<cr><esc>", "Save File" },
        S = { "<cmd>:w !sudo tee %<cr><esc>", "Sudo Save File" },
        v = { "<cmd>Explore<cr>", "Netrw" },
        z = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
    },

    g = {
        name = "+Git",
        L = { "<cmd>LazyGit<cr>", "Lazygit" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        B = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
        f = { "<cmd>Telescope git_files<cr>", "Git File" },
        g = { "<cmd>Neogit<cr>", "Neogit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        s = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
    },

    h = {
        name = "+Help",
        n = {
            name = "+Noice",
            l = { "<cmd>Noice last<cr>",  "Noice Last Message" },
            h = { "<cmd>Noice history<cr>",  "Noice History" },
            a = { "<cmd>Noice all<cr>",  "Noice All" },
            e = { "<cmd>Noice dismiss<cr>",  "Noice Dismiss All" },
        },
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
        -- o = {
        --     name = "Obsidian",
        --     C = { "<cmd>ObsidianCheckHealth<cr>", "Check Health" },
        --     T = { "<cmd>ObsidianTomorrow<cr>", "Open Tomorrow" },
        --     b = { "<cmd>ObsidianBacklinks<cr>", "Find Backlinks" },
        --     c = { "<cmd>ObsidianCheck<cr>", "Check" },
        --     f = { "<cmd>ObsidianFollowLink<cr>", "Follow Link" },
        --     l = { "<cmd>ObsidianLink<cr>", "Link" },
        --     n = { "<cmd>ObsidianNew<cr>", "New Note" },
        --     o = { "<cmd>ObsidianOpen<cr>", "Open" },
        --     s = { "<cmd>ObsidianQuickSwitch<cr>", "Quick Switch" },
        --     g = { "<cmd>ObsidianSearch<cr>", "Search" },
        --     t = { "<cmd>ObsidianToday<cr>", "Open Today" },
        --     y = { "<cmd>ObsidianYesterday<cr>", "Open Yesterday" },
        --     m = { "<cmd>ObsidianTemplate<cr>", "Add Template" },
        -- },
        w = {
            name = "Workspace",
            n = { "<cmd>Neorg workspace notes<cr>", "Notes workspace" },
            j = { "<cmd>Neorg workspace joyent<cr>", "Joyent workspace" },
        },
        z = {
            name = "Zettelkasten",
            I = { "<cmd>ZkIndex<cr>", "ZK Index"},
            N = { "<cmd>ZkNew<cr>", "ZK New"},
            c = { "<cmd>ZkCd<cr>", "ZK CD"},
            n = { "<cmd>ZkNotes<cr>", "ZK Notes Picker"},
            b = { "<cmd>ZkBacklinks<cr>", "ZK Backlinks"},
            l = { "<cmd>ZkLinks<cr>", "ZK Links"},
            i = { "<cmd>ZkInsertLink<cr>", "ZK Insert Links"},
            j = {
                name = "Journals",
                j = {"<cmd>ZkNew { dir = 'journals', date = 'today' }<cr>", "ZK Journal Today" },
                y = {"<cmd>ZkNew { dir = 'journals', date = 'yesterday' }<cr>", "ZK Journal Yesterday" },
                t = {"<cmd>ZkNew { dir = 'journals', date = 'tomorrow' }<cr>", "ZK Journal Tomorrow" },
            },
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
        p = { "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>", "Projects" },
        f = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Project files", },
    },

    q = {
        name = "+quit",
        q = {"<cmd>q!<CR>", "Quit" },
    },

    s = {
        name = "Search",
        B = { "<cmd>Telescope builtin<cr>", "Builtin" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        F = { "<cmd>Telescope filetypes<cr>", "filetypes" },
        H = { "<cmd>Telescope highlights<cr>", "highlights" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        e = { "<cmd>Telescope env<cr>", "Environment" },
        f = { "<cmd>Telescope find_pickers<cr>", "list pickers" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        o = { "<cmd>Telescope vim_options<cr>", "Options" },
        r = { "<cmd>Telescope resume<cr>", "Resume" },
        q = { "<cmd>Telescope quickfix<cr>", "Resume" },
        y = { "<cmd>Telescope glyph<cr>", "Glyph" },
    },

    S = {
        name = "+Source",
        ["."] = { "<cmd>source %<cr>", "Source Current File" },
        s = { "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua<CR>", "Source Snippets" },
    },

    t = {
        name = "Toggle",
        c = { "<cmd>Neorg toggle-concealer<cr>", "Toggle Concealer" },
        b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Gitsign Blame" },
        d = { "<cmd>Gitsigns toggle_deleted<cr>", "Toggle Gitsign Deleted" },
        t = {
            name = "Toggle Terminal",
            f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
            h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
            v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
        },
        u = { "<cmd>UndotreeToggle<cr>", "undo tree" },
    },


    w = {
        name = "+Windows",
        h = { '<C-w>|', 'Maximize window horizontally (|)' },
        v = { '<C-w>_', 'Maximize window vertically (_)' },
        ['='] = { '<C-w>=', 'Resize windows equally' },
        s = { ":lua require('telescope-tabs').list_tabs()<cr>", 'Search Tabs' },
        t = { "<cmd>WhichKey<cr>", "Whichkey Top Level" },
    },

    x = {
        c = { "<cmd>!chmod +x %<CR>", "chmod" },
    },
}

wk.register(mappings, wkopts)
