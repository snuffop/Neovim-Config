-- Lualine config
--
local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'arkav/lualine-lsp-progress',
    },
    lazy = false,
    config = function()
        local get_color = require'lualine.utils.utils'.extract_highlight_colors
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'dracula-nvim',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                    'alpha',
                    'plugins',
                    '[No Name]',
                    'vim-plug',
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
                lualine_a = { 'mode' },
                lualine_b = {
                    { 'b:gitsigns_head', icon = ' ' },
                    { 'diff', icon = '', source = diff_source },

                },
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        newfile_status = true,
                        path = 3,
                        shorting_target = 40,
                        symbols = {
                            modified = '[SAVE ME]',
                        },
                    },
                    {
                        '%=',
                        '%t%m',
                        '%3p'
                    },
                },
                lualine_x = {
                    {
                        'searchcount',
                    },
                    {
                        'diagnostics',
                        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
                        colored = true,
                        diagnostics_color = {
                            error = {fg = get_color("DiagnosticSignError", "fg")},
                            warn = {fg = get_color("DiagnosticSignWarn", "fg")},
                            info = {fg = get_color("DiagnosticSignInfo", "fg")},
                            hint = {fg = get_color("DiagnosticSignHint", "fg")},
                        },
                    },
                },
                lualine_y = {
                    'encoding',
                    'fileformat',
                    'filetype',
                },
                lualine_z = {
                    'progress',
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 3,
                    },
                },
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {
                lualine_a = {'buffers'},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {'tabs'},
                lualine_z = {'datetime'},
            },
            statusline = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    'lsp_progress',
                    display_components = {'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
                    spinner_symbols = {'⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'},
                },
            },
            winbar = {
                lualine_a = {'branch'},
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
                lualine_z = {
                    {
                        'filename',
                        file_status = true,
                        path = 4,
                        shorting_target = 40,
                    },
                },
            },
            extensions = {
                'nvim-tree',
                'fzf',
                'quickfix',
                'toggleterm',
                'trouble',
                'lazy',
            }
        }
    end
}



