--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- Fire Nvim

return {
    'glacambre/firenvim',
    lazy = false,
    build = ":call firenvim#install(0)"
}
