--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {
    {
        "cuducos/yaml.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "folke/snacks.nvim", -- optional
        },
    },

    {
        "ray-x/yamlmatter.nvim",
        ft = { "markdown" },
        config = function()
            require('yamlmatter').setup({
                icon_mappings = {
                    title = '',
                    idea = '',
                    default = '󰦨',
                },
                highlight_groups = {
                    icon = 'MyIconHighlight',
                    key = 'MyKeyHighlight',
                    value = 'MyValueHighlight',
                },
                key_value_padding = 4, -- Less space
                conceallevel = 2, -- on what level start conceal the yaml text

            })
        end
    }
}

