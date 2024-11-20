--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {
            window = {
                options = {
                    signcolumn = "no",
                    number = false,
                    relativenumber = false,
                    cursorline = false, -- disable cursorline
                    cursorcolumn = false, -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = true, -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    -- you may turn on/off statusline in zen mode by setting 'laststatus' 
                    -- statusline will be shown only if 'laststatus' == 3
                    laststatus = 0, -- turn off the statusline in zen mode
                },
                tmux = { 
                    enabled = true
                },
                alacritty = {
                    enabled = true,
                },
                kitty = {
                    enabled = true,
                },
            },
        },
    },
    {
        "folke/twilight.nvim",
        cmd = {
            "Twilight",
            "TwilightEnable",
            "TwilightDisable",
        },
        opts = {
            context = 10,
        },

    },

    {
        "preservim/vim-pencil",
        lazy = false,
    },
}
