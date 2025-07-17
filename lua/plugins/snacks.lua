--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

----------------------------------------------------------------------
--                  Enable more of Folke's snacks                   --
----------------------------------------------------------------------

return {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        explorer = { enabled = true },
        image = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
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
            layouts = {
                -- I wanted to modify the ivy layout height and preview pane width,
                -- this is the only way I was able to do it
                -- NOTE: I don't think this is the right way as I'm declaring all the
                -- other values below, if you know a better way, let me know
                --
                -- Then call this layout in the keymaps above
                -- got example from here
                -- https://github.com/folke/snacks.nvim/discussions/468
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
                -- I wanted to modify the layout width
                --
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
        -- Folke pointed me to the snacks docs
        -- https://github.com/LazyVim/LazyVim/discussions/4251#discussioncomment-11198069
        -- Here's the lazygit snak docs
        -- https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md
        lazygit = {
            theme = {
                selectedLineBgColor = { bg = "CursorLine" },
            },
            -- With this I make lazygit to use the entire screen, because by default there's
            -- "padding" added around the sides
            -- I asked in LazyGit, folke didn't like it xD xD xD
            -- https://github.com/folke/snacks.nvim/issues/719
            win = {
                -- -- The first option was to use the "dashboard" style, which uses a
                -- -- 0 height and width, see the styles documentation
                -- -- https://github.com/folke/snacks.nvim/blob/main/docs/styles.md
                -- style = "dashboard",
                -- But I can also explicitly set them, which also works, what the best
                -- way is? Who knows, but it works
                width = 0,
                height = 0,
            },
        },
    },
}

