return {
    'nvim-telescope/telescope.nvim',
    build = function()
        local ts_update = require('nvim-treesitter.install').up20230704({ with_sync = true })
        ts_update()
    end,
    dependencies = {
        {
            'nvim-lua/plenary.nvim',
            {
                'LinArcX/telescope-env.nvim',
                config = function()
                    require('telescope').load_extension("env")
                end,
            },
            {
                'ghassan0/telescope-glyph.nvim',
                config = function()
                    require('telescope').load_extension("glyph")
                end
            },
            {
                'keyvchan/telescope-find-pickers.nvim',
                config = function()
                    require('telescope').load_extension("find_pickers")
                end,
            },
            {
                'nvim-telescope/telescope-file-browser.nvim',
                config = function()
                    require('telescope').load_extension("file_browser")
                end
            },
            {
                'nvim-telescope/telescope-media-files.nvim'},
                config = function()
                    require('telescope').load_extension("media_files")
                end
            },
            {
                'benfowler/telescope-luasnip.nvim',
                config = function()
                    require('telescope').load_extension("luasnip")
                end,
            },
            {
                'jvgrootveld/telescope-zoxide',
                config = function()
                    require('telescope').load_extension("zoxide")
                end,
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                config = function()
                    require('telescope').load_extension('fzf')
                end,
            },
            {
                'tsakirist/telescope-lazy.nvim',
                config = function()
                    require('telescope').load_extension("lazy")
                end,
            },
            opts = {
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = {
                        shorten = { len = 12 },
                    },
                },
                extensions = {
                }
            },
        }
    }

