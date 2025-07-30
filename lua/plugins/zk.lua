--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- ZK config

return {
    "zk-org/zk-nvim",
    lazy = false,
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

        local zk = require("zk")
        local commands = require("zk.commands")
        local function make_edit_fn(defaults, picker_options)
            return function(options)
                options = vim.tbl_extend("force", defaults, options or {})
                zk.edit(options, picker_options)
            end
        end

        commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
        commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))

        vim.api.nvim_create_user_command('ZkUpdate', function(opts)
            -- Get the Zettelkasten base directory from Neovim's expanded path
            -- This assumes ZK_NOTEBOOK_DIR is typically your main ~/Zettelkasten
            local zk_dir = vim.fn.expand('~/Zettelkasten')
            local commit_message = opts.args ~= '' and opts.args or 'updating'
            local cmd_string = 'cd ' .. vim.shellescape(zk_dir) .. ' && git add -A && git commit -am ' .. vim.shellescape(commit_message) .. ' && git push && cd -'

            print('Running Git Update for Zettelkasten...')
            -- Use vim.cmd('term ...') to run in a terminal buffer for visibility
            vim.cmd('split | term ' .. cmd_string)
        end, { nargs = '?', complete = 'file', desc = 'ZK: Update Git Notebook' })

        vim.keymap.set("n", "<leader>nzj", function()
            local file = vim.fn.system("daily-file.sh")
            file = vim.fn.trim(file) -- Remove any trailing newline characters
            if vim.fn.filereadable(file) == 1 then
                vim.cmd("edit " .. file)
            else
                print("File not found: " .. file)
                require("zk.commands").get("ZkNew")({ dir = "journals" })
            end
        end, { desc = "ZK Daily Today" })
    end,
    keys = {
        { '<leader>nzI', function() require('zk').index() end, desc = "ZK index" },
        { '<leader>nzN', function() require('zk').new({ title = vim.fn.input('Title: ') }) end, desc = "ZK New" },
        { '<leader>nzN', function() require('zk').new_from_title_selection() end, desc = "ZK New" },
        { '<leader>nzU', '<Cmd>ZkUpdate<CR>', desc = "ZK Git Update" },
        { '<leader>nzb', function() require('zk').backlinks() end, desc = "ZK Backlinks" },
        { '<leader>nzc', function() require('zk').cd() end, desc = "ZK cd" },
        { '<leader>nzf', function() require('zk').match() end, desc = "ZK Match" },
        { '<leader>nzi', function() require('zk').insert_link() end, desc = "ZK Insert Link" },
        { '<leader>nzi', function() require('zk').insert_link_at_selection() end, desc = "ZK Insert Link" },
        { '<leader>nzl', function() require('zk').links() end, desc = "ZK Links" },
        { '<leader>nzr', function() require('zk').notes({ createdAfter = '3 days ago' }) end, desc = "ZK Recent" },
        { '<leader>nzt', function() require('zk').tags() end, desc = "ZK Tags" },
        { '<leader>nzz', function() require('zk').notes({ sort = { 'modified' } }) end, desc = "ZK Notes" },
    }
}

