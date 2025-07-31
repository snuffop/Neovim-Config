--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

-- JQ interface

if vim.uv.os_gethostname() == "archzen" or vim.uv.os_gethostname() == "archovo" then
    return {
        "cenk1cenk2/jq.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "grapp-dev/nui-components.nvim",
        },
    }
else
    return {}
end
