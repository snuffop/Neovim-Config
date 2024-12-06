--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- I3 Config syntax etc

return {
    "mboughaba/i3config.vim",
    config = function()
        vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead"}, {
            pattern = {
                "~/.config/i3/config",
                "~/.config/sway/config",
            },
            callback = function()
                vim.bo.filetype = "i3config"
                vim.bo.commentstring = "# %s"
                end
            end,
        },
}
