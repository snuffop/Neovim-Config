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
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    'alpha',
                    'plugins',
                    '[No Name]',
                    'vim-plug',
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000, 
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    { 'b:gitsigns_head', icon = '' },
                    { 'diff', icon = '', source = diff_source },
                },
                lualine_c = {
                    {
                        'filename',
                        file_status = false,
                        path = 1,
                    },
                },
                lualine_x = {
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
                        path = 4,
                    },
                },
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            statusline = {
                lualine_z = {
                    'lsp_progress',
                    display_components = {'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
                    spinner_symbols = {'⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'},
                },
            },
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
                        path = 4,
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
                'fugitive',
                'quickfix',
            }
        }
    end
}



