--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- CMP override to NOT use preselect

return {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
        table.insert(opts.sources, { name = "neorg" })

        local cmp = require("cmp")

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        opts.preselect = cmp.PreselectMode.None
        opts.completion = { completeopt = "menu,menuone,preview,noinsert,noselect" }
        opts.experimental.ghost_text = false

        table.insert(opts.sources, 1, {
            name = "neorg",
            group_index = 1,
            priority = 100,
        })

        table.insert(opts.sources, 1, {
            name = 'orgmode',
            group_index = 1,
            priority = 100,
        })

        table.insert(opts.sources, 1, {
            name = 'mkdnflow',
            group_index = 1,
            priority = 100,
        })

        opts.mapping = vim.tbl_extend("force", opts.mapping, {
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.snippet.active({ direction = 1 }) then
                    vim.schedule(function()
                        vim.snippet.jump(1)
                    end)
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.snippet.active({ direction = -1 }) then
                    vim.schedule(function()
                        vim.snippet.jump(-1)
                    end)
                else
                    fallback()
                end
            end, { "i", "s" }),
        })
    end,
}
