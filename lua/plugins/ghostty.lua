--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

-- Provides syntax highlighting for the ghostty config file
-- No additional dependencies required, Zilchmasta was kind enough to let me
-- know about this in discord
-- https://discord.com/channels/1005603569187160125/1300462095946485790/1300534513788653630

if vim.uv.os_gethostname() == "archzen" or vim.uv.os_gethostname() == "archovo" then
    return {
        "ghostty",
        dir = "/usr/share/vim/vimfiles/",
        lazy = false,
    }
else
    return {}
end

