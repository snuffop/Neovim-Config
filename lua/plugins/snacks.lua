--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

----------------------------------------------------------------------
--                  Enable more of Folke's snacks                   --
----------------------------------------------------------------------

return {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        explorer = { enabled = true },
        gh = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                header = [[
                                                          Z
      █████                      ███     ██         z  
     █████                        ███                   
     ███   ███ ██████████████████ ██  █████ 
    ███    ████     ██  ██████████ ███ ████████ 
   ███    ████   ██    ███████████ ███ ███ ██ ███ 
 █████████     ██ ██         ██ ████ ███ ███ ██ ███ 
███████████████████████████████  ██ ███ ███ ██ ███]],
            },
        },
        gh = { 
            enabled = true,
            keys = {
                { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
                { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
                { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
                { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
            },
        },
        picker = {
            enabled = true,
            matcher = {
                cwd_bonus = true,
                frecency = true,
                history_bonus = true,
            },
            debug = {
                scores = false,
            },
            layout = {
                preset = "ivy",
                cycle = false,
            },
            layouts = {
                ivy = {
                    layout = {
                        box = "vertical",
                        backdrop = false,
                        row = -1,
                        width = 0,
                        height = 0.5,
                        border = "top",
                        title = " {title} {live} {flags}",
                        title_pos = "left",
                        { win = "input", height = 1, border = "bottom" },
                        {
                            box = "horizontal",
                            { win = "list", border = "none" },
                            { win = "preview", title = "{preview}", width = 0.5, border = "left" },
                        },
                    },
                },
                vertical = {
                    layout = {
                        backdrop = false,
                        width = 0.8,
                        min_width = 80,
                        height = 0.8,
                        min_height = 30,
                        box = "vertical",
                        border = "rounded",
                        title = "{title} {live} {flags}",
                        title_pos = "center",
                        { win = "input", height = 1, border = "bottom" },
                        { win = "list", border = "none" },
                        { win = "preview", title = "{preview}", height = 0.4, border = "top" },
                    },
                },
            },
            matcher = {
                frecency = true,
            },
            win = {
                input = {
                    keys = {
                        -- to close the picker on ESC instead of going to normal mode,
                        -- add the following keymap to your config
                        ["<Esc>"] = { "close", mode = { "n", "i" } },
                        -- I'm used to scrolling like this in LazyGit
                        ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
                        ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
                        ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
                        ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
                    },
                },
            },
            formatters = {
                file = {
                    filename_first = true, -- display filename before the file path
                    truncate = 80,
                },
            },
        },
        lazygit = {
            theme = {
                selectedLineBgColor = { bg = "CursorLine" },
            },
            win = {
                width = 0,
                height = 0,
            },
        },
        notifier = {
            enabled = true,
            top_down = false, -- place notifications from top to bottom
        },
        styles = {
            snacks_image = {
                relative = "editor",
                col = -1,
            },
        },
        image = {
            enabled = true,
            float = true,
        },
    },
}
