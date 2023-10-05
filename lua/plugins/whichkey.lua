-- requring plugin
local installed, WhichKey = pcall(require, "which-key")
if not installed then
    vim.notify("Plugin 'which-key' is not installed")
    return
end

-- requring plugin
local installed, ToggleTerm = pcall(require, "toggleterm.terminal")
if not installed then
    vim.notify("Plugin 'toggleterm' is not installed")
    return
end

-- ##################################################################################################

local wk = WhichKey

local Terminal = ToggleTerm.Terminal
local toggle_float = function()
    local float = Terminal:new({ direction = "float" })
    return float:toggle()
end

local toggle_lazygit = function()
    local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
    return lazygit:toggle()
end

WhichKey.setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    operators = { gc = "Comments" },
    motions = {
        count = true,
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-j>", -- binding to scroll down inside the popup
        scroll_up = "<c-k>", -- binding to scroll up inside the popup
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000, -- positive value to position WhichKey above other floating windows.
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto",
    triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
    },
})

-- ##################################################################################################
-- Keymaps

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

    -- APPLICATION
    a = {
        name = "+Application",
        a = { "<cmd>Alpha<cr>", "Alpha" },
        n = { "<cmd>Nnn<cr>", "Nnn toggle" },
        l = {
            name = "Lazy",
            s = { "<cmd>Lazy sync<cr>", "Sync" },
            i = { "<cmd>Lazy install<cr>", "Install" },
            p = { "<cmd>Telescope lazy<cr>", "Telescope" },
            l = { "<cmd>Lazy<cr>", "Status" },
        },
        d = {
            name = "+Distant",
            C =     { "<cmd>DistantConnect<CR>", "Distant Connect" },
            M =     { "<cmd>DistantMetadata<CR>", "Distant Metadata" },
            R =     { "<cmd>DistantRemove<CR>", "Distant Remove" },
            S =     { "<cmd>DistantShell<CR>", "Distant Shell" },
            ["/"] = { "<cmd>DistantSearch<CR>", "Distant Search" },
            c =     { "<cmd>DistantCopy<CR>", "Distant Copy" },
            d =     { "<cmd>Distand<CR>", "Distant" },
            i =     { "<cmd>DistantInstall<CR>", "Distant Install" },
            l =     { "<cmd>DistantLaunch<CR>", "Distant Launch" },
            m =     { "<cmd>DistantMkdir<CR>", "Distant Mkdir" },
            r =     { "<cmd>DistantRename<CR>", "Distant Rename" },
            w =     { "<cmd>DistantSpawn<CR>", "Distant Spawn" },
            x =     { "<cmd>DistantRun<CR>", "Distant Run" },
            z =     { "<cmd>DistantCancelSearch<CR>", "Distant Cancels Search " },
            I = {
                name = "Info",
                s =     { "<cmd>DistantSystemInfo<CR>", "Distant System Info" },
                S =     { "<cmd>DistantSessionInfo<CR>", "Distant Session Info" },
                C =     { "<cmd>DistantCheckHealth<CR>", "Distant Check Health " },
                z =     { "<cmd>DistantClientVersion<CR>", "Distant Client Version " },
            },
        },
    },

    -- BUFFER
    b = {
        name = "+Buffers",
        b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
        d = { "<cmd>Bdelete<cr>", "Delete Buffer" },
        l = { ":lua require('telescope.builtin').buffers()<cr>", "List" },
        p = { "<cmd>BufferLineTogglePin<cr>", "Toggle Pin" },
        s = { "<cmd>BufferLinePick<cr>", "Select" },
        w = { "<cmd>Bwipeout<cr>", "Wipeout  Buffer" },
    },

    -- CODE
    c = {
        name = "+Code",
        m = { "<cmd>:Mason<cr>", "Mason" },
        i = { "<cmd>:Inspect<cr>", "TS Inspect" },
        t = { "<cmd>:TagbarToggle<cr>", "Tagbar toggle" },
        I = { "<cmd>:TSInstallInfo<cr>", "TS Install Info" },
    },

    -- D
    d = {
        name = "+dired",
        j = { "<cmd>Oil<cr>", "Oil Dired Jump" },  -- Ment for my finger memory
    },

    f = {
        name = "+File",
        ["."] = { "<cmd>source %<cr>", "source current file" },
        b = { "<cmd>Telescope file_browser<cr>", "Telescope file_browser" },
        c = { "<cmd>lua require('telescope.builtin').find_files({cwd = '~/.config/nvim/'})<cr>", "Find Config Files" },
        d = { "<cmd>Oil<cr>", "Oil " },
        e = { "<cmd>NvimTreeToggle<cr>", "Nvim-Tree" },
        f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
        g = { "<cmd>Telescope git_files<cr>", "Git File" },
        o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        r = { "<cmd>Ranger<cr>", "Ranger Vim" },
        s = { "<cmd>up<cr><esc>", "Save File" },
        S = { "<cmd>SudaWrite<cr><esc>", "Sudo Save File" },
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
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
        f = { "<cmd>Telescope git_files<cr>", "Git File" },
        g = { "<cmd>Neogit<cr>", "Neogit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        s = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        t = {
            name = "+Git Toggle",
            b = { "<cmd>gitsigns toggle_current_line_blame<cr>", "toggle gitsign blame" },
            d = { "<cmd>gitsigns toggle_deleted<cr>", "toggle gitsign deleted" },
        },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    },

    h = {
        name = "+Help",
        h = { "<cmd>nohlsearch<CR>", "Clear Search" },
        n = {
            name = "+Noice",
            l = { "<cmd>Noice last<cr>", "Noice Last Message" },
            h = { "<cmd>Noice history<cr>", "Noice History" },
            a = { "<cmd>Noice all<cr>", "Noice All" },
            e = { "<cmd>Noice dismiss<cr>", "Noice Dismiss All" },
        },
    },

    l = {
        name = "LSP",
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
        k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        m = { "<cmd>Mason<cr>", "Mason" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
    },

    m = {
        name = "+harpoon",
        a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "goto mark 1" },
        d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "goto mark 3" },
        e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "goto mark 8" },
        f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "goto mark 4" },
        g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "goto mark 5" },
        m = { ":lua require('harpoon.mark').add_file()<cr>", "mark file" },
        n = { ":lua require('harpoon.ui').nav_next()<cr>", "next file" },
        p = { ":lua require('harpoon.ui').nav_prev()<cr>", "prev file" },
        q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "goto mark 6" },
        r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "goto mark 9" },
        s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "goto mark 2" },
        t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "toggle ui" },
        w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "goto mark 7" },
    },

    n = {
        name = "+notes",
        n = { "<cmd>Neorg index<cr>", "neorg index" },
        N = { "<cmd>lua core.dirman.new.note()<cr>", "Neorg New Note" },
        r = { "<cmd>Neorg return<cr>", "neorg return" },
        s = { "<cmd>Telescope Neorg search_headings<cr>", "search headings" },
        f = { "<cmd>Telescope Neorg find_linkable<cr>", "search linkable" },
        t = { "<cmd>Neorg toc qflist", "TOC Quick list"},
        j = {
            name = "neorg journal",
            j = { "<cmd>Neorg journal today<cr>", "today" },
            t = { "<cmd>Neorg journal tomorrow<cr>", "tomorrow" },
            y = { "<cmd>Neorg journal yesterday<cr>", "yesterday" },
            c = { "<cmd>Neorg journal custom", "custom" },
            T = { "<cmd>Neorg journal template<cr>", "template" },
        },
        x = {
            name = "neorg tool",
            s = { "<cmd>Neorg generate-workspace-summary<cr>", "neorg summary" },
            i = { "<cmd>Neorg inject-metadata<cr>", "inject metadata" },
            u = { "<cmd>Neorg update-metadata<cr>", "update metadata" },
        },
        w = {
            name = "workspace",
            n = { "<cmd>Neorg workspace notes<cr>", "notes workspace" },
            j = { "<cmd>Neorg workspace joyent<cr>", "joyent workspace" },
        },
    },

    -- OPEN My Files
    o = {
        name = "+open",
        m = {
            name = "my",
            i = { "<cmd>edit ~/Nextcloud/Neorg/index.norg<CR>", "Notes Index" },
            j = { "<cmd>edit ~/Nextcloud/Neorg/joyent/Joyent Index.norg<CR>", "Joyent Index" },
            g = { "<cmd>edit ~/Nextcloud/Neorg/joyent/Joyent Gage Index.norg<CR>", "Joyent Gage Index" },
        },
    },

    -- PROJECT
    p = {
        name = "+projects",
        p = { "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>", "projects" },
        f = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "project files" },
    },

    q = {
        name = "+quit",
        q = { "<cmd>q!<cr>", "quit" },
    },

    -- SEARCH
    s = {
        name = "search",
        ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Buffer"},
        ["`"] = { "<cmd>Telescope resume<cr>", "Resume previous search" },
        B = { "<cmd>Telescope git_branches<cr>", "checkout branch" },
        C = { "<cmd>Telescope colorscheme<cr>", "colorscheme" },
        F = { "<cmd>Telescope filetypes<cr>", "filetypes" },
        H = { "<cmd>Telescope highlights<cr>", "highlights" },
        b = { "<cmd>Telescope builtin<cr>", "builtin" },
        c = { "<cmd>Telescope commands<cr>", "commands" },
        e = { "<cmd>Telescope env<cr>", "environment" },
        f = { "<cmd>Telescope find_pickers<cr>", "list pickers" },
        g = {
            name = "+Git Worktree",
            g = { "<cmd>Telescope git_worktree git_worktrees<CR>", "Switch Git Worktree" },
            c = { "<cmd>Telescope git_worktree create_git_worktree<CR>", "Create Git Worktree" },
        },
        h = { "<cmd>Telescope help_tags<cr>", "find help" },
        k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
        m = { "<cmd>Telescope man_pages<cr>", "man pages" },
        o = { "<cmd>Telescope vim_options<cr>", "options" },
        q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
        r = { "<cmd>Telescope registers<cr>", "registers" },
        s = { "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua<cr>", "source snippets" },
        y = { "<cmd>Telescope glyph<cr>", "glyph" },
    },

    -- TOGGLE
    t = {
        name = "toggle",
        c = { "<cmd>neorg toggle-concealer<cr>", "toggle concealer" },
        j = {
            name = "+TreeSJ",
            t = { "<cmd>TSJToggle<cr>", "Trees J toggle" },
            s = { "<cmd>TSJSplit<cr>", "Trees J Split" },
            j = { "<cmd>TSJJoin<cr>", "Trees J Join" },

        },
        t = {
            name = "toggle terminal",
            f = { "<cmd>toggleterm direction=float<cr>", "float" },
            h = { "<cmd>toggleterm size=10 direction=horizontal<cr>", "horizontal" },
            v = { "<cmd>toggleterm size=80 direction=vertical<cr>", "vertical" },
        },
        u = { "<cmd>undotreetoggle<cr>", "undo tree" },
    },

    w = {
        name = "+windows",
        h = { "<c-w>|", "maximize window horizontally (|)" },
        v = { "<C-w>_", "Maximize window vertically (_)" },
        ["="] = { "<C-w>=", "Resize windows equally" },
        s = { ":lua require('telescope-tabs').list_tabs()<cr>", "Search Tabs" },
        t = { "<cmd>WhichKey<cr>", "Whichkey Top Level" },
    },


    x = {
        c = { "<cmd>!chmod +x %<CR>", "chmod" },
    },
}

wk.register(mappings, wkopts)
