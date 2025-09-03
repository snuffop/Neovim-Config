--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    'duckdm/neowarrior.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    cmd = {
        "NeoWarriorOpen",
        "NeoWarriorAdd",
        "NeoWarriorFilter",
        "NeoWarriorFilterSelect",
        "NeoWarriorReport",
        "NeoWarriorRefresh",
    },
    --- See config example below
    opts = {}
}
