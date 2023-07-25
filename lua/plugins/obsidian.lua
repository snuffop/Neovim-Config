-- Obsidian
return {
    {
        'epwalsh/obsidian.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'hrsh7th/nvim-cmp',
            'nvim-telescope/telescope.nvim',
            'godlygeek/tabular',
            'preservim/vim-markdown',
        },
        init = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_frontmatter = 0
            vim.g.vim_markdown_new_list_item_indent = 0
        end,
        config = function()
            require('obsidian').setup {
                dir = "~/Nextcloud/Obsidian/", -- no need to call 'vim.fn.expand' here
                notes_subdir = "notes",

                daily_notes = {
                    folder = "notes/dailies",
                    date_format = "%Y-%m-%d",
                },

                -- Optional, completion.
                completion = {
                    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
                    new_notes_location = "notes_subdir"
                },

                -- Optional, customize how names/IDs for new notes are created.
                note_id_func = function(title)
                    local suffix = ""
                    if title ~= nil then
                        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                    else
                        for _ = 1, 4 do
                            suffix = suffix .. string.char(math.random(65, 90))
                        end
                    end
                    return tostring(os.time()) .. "-" .. suffix
                end,

                -- Optional, set to true if you don't want Obsidian to manage frontmatter.
                disable_frontmatter = false,

                -- Optional, alternatively you can customize the frontmatter data.
                note_frontmatter_func = function(note)
                    -- This is equivalent to the default frontmatter function.
                    local out = { id = note.id, aliases = note.aliases, tags = note.tags }
                    -- `note.metadata` contains any manually added fields in the frontmatter.
                    -- So here we just make sure those fields are kept in the frontmatter.
                    if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
                        for k, v in pairs(note.metadata) do
                            out[k] = v
                        end
                    end
                    return out
                end,

                templates = {
                    subdir = "templates",
                    date_format = "%Y-%m-%d-%a",
                    time_format = "%H:%M",
                },

                follow_url_func = function(url)
                    -- vim.fn.jobstart({"open", url})  -- Mac OS
                    vim.fn.jobstart({ "xdg-open", url }) -- linux
                end,

                use_advanced_uri = true,
                open_app_foreground = false,

                finder = "telescope.nvim",

                -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
                -- see also: 'follow_url_func' config option above.
                vim.keymap.set("n", "gf", function()
                    if require("obsidian").util.cursor_on_markdown_link() then
                        return "<cmd>ObsidianFollowLink<CR>"
                    else
                        return "gf"
                    end
                end, { noremap = false, expr = true })
            }
        end
    }
}

