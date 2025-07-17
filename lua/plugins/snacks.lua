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
        },
    },
}

