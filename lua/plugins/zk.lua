--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯
--
-- ZK config
--  LOG  2025 10 09  Update with Nextcloud Notes being the new location
--

return {
    "zk-org/zk-nvim",
    lazy = false,
    ft = "markdown",

    config = function ()
        require("zk").setup({
            picker = "snacks_picker",
            picker_options = {
                snacks_picker = {
                    layout = {
                        preset = "ivy",
                    },
                },
            },
            lsp = {
                config = {
                    name = "zk",
                    cmd = {"zk", "lsp"},
                    filetypes = { "markdown" },
                }
            },
            auto_attach = {
                enable = true,
            }
        })

        local lsp = require("lspconfig")
        lsp.zk.setup({
            on_attach = function(client, bufnr)
                -- your keymaps here
            end,
        })

        local zk = require("zk")
        local zk_ui = require("zk.ui")
        local zk_commands = require("zk.commands")

        local function make_edit_fn(defaults, picker_options)
            return function(options)
                options = vim.tbl_extend("force", defaults, options or {})
                zk.edit(options, picker_options)
            end
        end

        local function zk_new_prompt(dir)
            local title = vim.fn.input("Title: ")
            if title == "" then return end
            zk_commands.get("ZkNew")({
                dir = dir,
                title = title,
            })
        end
        zk_commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
        zk_commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))

        vim.api.nvim_create_user_command('ZkUpdate', function(opts)
            -- Get the Zettelkasten base directory from Neovim's expanded path
            -- This assumes ZK_NOTEBOOK_DIR is typically your main ~/Zettelkasten
            local zk_dir = vim.fn.expand('~/Nextcloud/Notes')
            local commit_message = opts.args ~= '' and opts.args or 'updating'
            local cmd_string = 'cd ' .. vim.shellescape(zk_dir) .. ' && git add -A && git commit -am ' .. vim.shellescape(commit_message) .. ' && git push && cd -'
            print('Running Git Update for Zettelkasten...')
            -- Use vim.cmd('term ...') to run in a terminal buffer for visibility
            vim.cmd('split | term ' .. cmd_string)
        end, { nargs = '?', complete = 'file', desc = 'ZK: Update Git Notebook' })

        vim.keymap.set("n", "<leader>z<Space>z", function()
            require("zk.commands").get("ZkNew")({
                dir = "journals",
                title = os.date("%Y-%m-%d"),
            })
        end, { desc = "ZK: New journal note (today)" })

        vim.keymap.set("n", "<leader>z<Space>d", function()
            require("zk.commands").get("ZkNotes")({ dir = "journals" })
        end, { desc = "ZK: List all journal files" })

        -- ZK Tags Picker (<leader>nzt)
        vim.keymap.set("n", "<leader>zts", function()
            zk_commands.get("ZkTags")({}, function(tags)
                zk_ui.pick_tags(tags, {}, function(selected)
                    if selected then
                        zk_commands.get("ZkNotes")({ tags = { selected } }, function(notes)
                            zk_ui.pick_notes(notes, { title = "Notes with tag: " .. selected }, function(note)
                                if note then
                                    vim.cmd("edit " .. note.path)
                                end
                            end)
                        end)
                    end
                end)
            end)
        end, { desc = "ZK Tags Picker" })

        -- ZK All Notes Picker, sorted by modified (<leader>nzz)
        vim.keymap.set("n", "<leader>zz", function()
            zk_commands.get("ZkNotes")({ sort = { "modified" } }, function(notes)
                zk_ui.pick_notes(notes, { title = "ZK All Notes (by modified)" }, function(selected)
                    if selected then
                        vim.cmd("edit " .. selected.path)
                    end
                end)
            end)
        end, { desc = "ZK All Notes (sorted by modified)" })

        -- ZK Recent Notes Picker (<leader>nzr)
        vim.keymap.set("n", "<leader>zr", function()
            zk_commands.get("ZkNotes")({ createdAfter = '3 days ago' }, function(notes)
                zk_ui.pick_notes(notes, { title = "ZK Recent Notes" }, function(selected)
                    if selected then
                        vim.cmd("edit " .. selected.path)
                    end
                end)
            end)
        end, { desc = "ZK Recent Notes" })

        vim.keymap.set("n", "<leader>znn", function()
            zk_new_prompt("inbox")
        end, { desc = "ZK: New inbox (prompt title)" })

        vim.keymap.set("n", "<leader>znp", function()
            zk_new_prompt("Resource/People")
        end, { desc = "ZK: New People note (prompt title)" })

        vim.keymap.set("n", "<leader>znt", function()
            zk_new_prompt("Resource/TipJar")
        end, { desc = "ZK: New TipJar note (prompt title)" })

        vim.keymap.set("n", "<leader>znc", function()
            zk_new_prompt("Resource/Corporations")
        end, { desc = "ZK: New Corporations note (prompt title)" })

        vim.keymap.set("n", "<leader>znj", function()
            zk_new_prompt("Area/Joyent")
        end, { desc = "ZK: New Joyent note (prompt title)" })

        vim.keymap.set("i", "<C-S-i>", function()
            require("zk.commands").get("ZkInsertLink")()
        end, { desc = "Insert or create ZK link" })

        vim.keymap.set("v", "<C-S-i>", function()
            require("zk.commands").get("ZkInsertLink")()
        end, { desc = "Insert or create ZK link from selection" })

    end,
    keys = {
        { '<leader>zU', '<Cmd>ZkUpdate<CR>', desc = "ZK Git Update" },
        { '<leader>zN', function() require('zk').new({ title = vim.fn.input('Title: ') }) end, desc = "ZK New (Prompt)" },
        { '<leader>zc', function() require('zk').cd() end, desc = "ZK CD" },
        { '<leader>zI', function() require('zk').index() end, desc = "ZK Index" },
        {   '<leader>zl',
            "<Cmd>ZkLinks<CR>",
            mode = "n",
            desc = "ZK Links"
        },
        {   '<leader>zi',
            "<Cmd>ZkInsertLink<CR>",
            mode = "n",
            desc = "ZK Insert Link (Picker)",
        },
        {   '<leader>zb',
            "<Cmd>ZkBacklinks<CR>",
            mode = "n",
            desc = "ZK Backlinks",
        },
        {
            '<leader>zf',
            "<Cmd>:'<,'>ZkMatch<CR>",
            mode = "v",
            desc = "ZK Match (Visual Selection)",
        },
        {
            '<leader>zi', -- Re-using <leader>nzi for visual mode, as it's common for context-sensitive actions
            "<Cmd>:'<,'>ZkInsertLinkAtSelection<CR>",
            mode = "v",
            desc = "ZK Insert Link (Visual Selection)",
        },
        {
            '<leader>zN', -- Re-using <leader>nzN for visual mode
            "<Cmd>:'<,'>ZkNewFromTitleSelection<CR>",
            mode = "v",
            desc = "ZK New From Title (Visual Selection)",
        },
    },
}
