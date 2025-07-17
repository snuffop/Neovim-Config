--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

if vim.uv.os_gethostname() == "archzen" or vim.uv.os_gethostname() == "archovo" then
return {
    "wakatime/vim-wakatime",
    lazy = false,
}
else
    return {}
end
