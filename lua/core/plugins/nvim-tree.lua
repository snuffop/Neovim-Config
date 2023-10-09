-- requring plugin
local installed, NvimTree = pcall(require, "nvim-tree")
if not installed then
    vim.notify("Plugin 'nvim-tree' is not installed")
    return
end

local api = require("nvim-tree.api")

local function edit_or_open()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
    else
        -- open file
        api.node.open.edit()
        -- Close the tree if file was opened
        api.tree.close()
    end
end

-- open as vsplit on current node
local function vsplit_preview()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
    else
        -- open file as vsplit
        api.node.open.vertical()
    end

    -- Finally refocus on tree if it was lost
    api.tree.focus()
end

local function my_on_attach(bufnr)
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    -- custom mappings
    vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    vim.keymap.set("n", "L", edit_or_open, opts("Edit Or Open"))
    vim.keymap.set("n", "l", vsplit_preview, opts("Vsplit Preview"))
    vim.keymap.set("n", "H", api.tree.close, opts("Close"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
end

-- Setting up nvim-tree
NvimTree.setup({
    auto_reload_on_write = true,
    sort_by = "case_sensitive",

    view = {
        width = 50,
        side = "left",
        number = true,
        relativenumber = true,
    },
    filters = {
        dotfiles = true,
    },

    renderer = {
        add_trailing = false,
        group_empty = true,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        highlight_modified = "none",
        root_folder_label = ":~:s?$?/..?",
        indent_width = 2,

        indent_markers = {
            enable = true, -- enables the tree like line
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },

        icons = {
            webdev_colors = true,
            git_placement = "before",
            modified_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
            },

            glyphs = {
                default = "",
                symlink = "",
                bookmark = "",
                modified = "●",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },

                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        }, -- end of icons rendering

        special_files = {
            "Cargo.toml",
            "Makefile",
            "README.md",
            "readme.md",
        },
        symlink_destination = true,
    }, -- end of rendering

    ui = {
        confirm = {
            remove = true,
            trash = true,
        },
    },

    on_attach = my_on_attach,
})
