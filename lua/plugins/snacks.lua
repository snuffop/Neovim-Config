--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

----------------------------------------------------------------------
--                  Enable more of Folke's snacks                   --
----------------------------------------------------------------------

return {
    'folke/snacks.nvim',
    opts = {
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        toggle = { map = LazyVim.safe_keymap_set },
        words = { enabled = true },
        dashboard = {
            sections = {
                { section = "header" },
                {
                    pane = 2,
                    section = "terminal",
                    cmd = "colorscript -e square",
                    height = 5,
                    padding = 1,
                },
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = function()
                        return Snacks.git.get_root() ~= nil
                    end,
                    cmd = "git status --short --branch --renames",
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = "startup" },
            },
        },
    },
    keys = {

        -- -- Iterate through incomplete tasks in Snacks_picker
        -- -- You can confirm in your teminal lamw26wmal with:
        {
            -- -- rg "^\s*-\s\[ \]" test-markdown.md
            "<leader>tt",
            function()
                Snacks.picker.grep({
                    prompt = " ",
                    -- pass your desired search as a static pattern
                    search = "^\\s*- \\[ \\]",
                    -- we enable regex so the pattern is interpreted as a regex
                    regex = true,
                    -- no “live grep” needed here since we have a fixed pattern
                    live = false,
                    -- restrict search to the current working directory
                    dirs = { vim.fn.getcwd() },
                    -- include files ignored by .gitignore
                    args = { "--no-ignore" },
                    -- Start in normal mode
                    on_show = function()
                        vim.cmd.stopinsert()
                    end,
                    finder = "grep",
                    format = "file",
                    show_empty = true,
                    supports_live = false,
                    layout = "ivy",
                })
            end,
            desc = "[P]Search for incomplete tasks",
        },
        -- -- Iterate throuth completed tasks in Snacks_picker lamw26wmal
        {
            "<leader>tc",
            function()
                Snacks.picker.grep({
                    prompt = " ",
                    -- pass your desired search as a static pattern
                    search = "^\\s*- \\[x\\] `done:",
                    -- we enable regex so the pattern is interpreted as a regex
                    regex = true,
                    -- no “live grep” needed here since we have a fixed pattern
                    live = false,
                    -- restrict search to the current working directory
                    dirs = { vim.fn.getcwd() },
                    -- include files ignored by .gitignore
                    args = { "--no-ignore" },
                    -- Start in normal mode
                    on_show = function()
                        vim.cmd.stopinsert()
                    end,
                    finder = "grep",
                    format = "file",
                    show_empty = true,
                    supports_live = false,
                    layout = "ivy",
                })
            end,
            desc = "[P]Search for complete tasks",
        },
    },
}
