
return {
    {
        'nvim-tree/nvim-tree.lua',
        cmd = {
            "NvimTreeOpen",
            "NvimTreeToggle",
            "NvimTreeFocus",
            "NvimTreeFileFile",
            "NvimTreeCollapse",
        },
        config = function()

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
                vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,    opts('Up'))
                vim.keymap.set('n', '?',     api.tree.toggle_help,              opts('Help'))
                vim.keymap.set("n", "L",     edit_or_open,                      opts("Edit Or Open"))
                vim.keymap.set("n", "l",     vsplit_preview,                    opts("Vsplit Preview"))
                vim.keymap.set("n", "H",     api.tree.close,                    opts("Close"))
                vim.keymap.set("n", "h",     api.tree.collapse_all,             opts("Collapse All"))
            end


            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                live_filter = {
                    prefix = "[FILTER]: ",
                    always_show_folders = false,
                },
                view = {
                    width = 35,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
                on_attach = my_on_attach,
            })
        end,
    }
}
