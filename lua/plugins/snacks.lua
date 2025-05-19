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
    },
}
