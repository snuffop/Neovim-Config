--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- I3 Config syntax etc

return {
  "mboughaba/i3config.vim",
  config = function()
    vim.cmd([[
        aug i3config_ft_detection
        au!
        au BufNewFile,BufRead ~/.config/i3/config call SetI3Config()
        au BufNewFile,BufRead ~/.config/sway/config call SetI3Config()

        function SetI3Config()
            setlocal commentstring=#
            set filetype=i3config
        aug end
    ]])
  end,
}
