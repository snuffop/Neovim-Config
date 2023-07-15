-- Lualine config
return {
    'nvim-lualine/lualine.nvim',
    config = {
        options = {
            icons_enabled = true,
            theme = 'dracula',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {
                {
                    'filename',
                    file_status = true,
                    path = 1,
                },
            },
            lualine_x = {
                'encoding',
                'fileformat',
                'filetype',
            },
            lualine_y = {'progress'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {
                    'filename',
                    file_status = true,
                    path = 1,
                },
            },
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},

        winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
                {
                    'filename',
                    file_status = true,
                    path = 1,
                },
            },
        },

        inactive_winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {'filename'},
        },
        extensions = {
            'nvim-tree',
            'fzf',
        }
    }
}
