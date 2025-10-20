--  ╭──────────────────────────────────────────────────────────╮
--  │ Obsidian.nvim + Markdown-Oxide (LazyVim v15 + blink.cmp) │
--  ╰──────────────────────────────────────────────────────────╯

return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        ft = "markdown",
        cmd = {
            "Obsidian",
        },
        opts = {
            lsp = {
                enabled = false,
            },
            workspaces = {
                { name = "default", path = "~/Nextcloud/Oxide/default" },
            },
            attachments = {
                folder = "Resource/attach/{{title}}"
            },
            notes_subdir = "Resource",
            daily_notes = {
                folder = "journals",
                date_format = "%Y-%m-%d",
                template = "daily.md",
            },
            templates = {
                folder = "Templates",
                substitutions = {
                    date = function() return os.date("%Y-%m-%d") end,
                    time = function() return os.date("%H:%M") end,
                    fulldate = function()
                        local d = os.date("*t")
                        local day = os.date("%A", os.time(d))
                        local month = os.date("%B", os.time(d))
                        local day_num = tonumber(os.date("%d", os.time(d)))
                        local suffix =
                        (day_num % 10 == 1 and day_num ~= 11 and "st")
                        or (day_num % 10 == 2 and day_num ~= 12 and "nd")
                        or (day_num % 10 == 3 and day_num ~= 13 and "rd")
                        or "th"
                        return string.format("%s %s %d%s %d", day, month, day_num, suffix, d.year)
                    end,
                },
            },
            disable_frontmatter = false,
            note_id_func = function(title)
                -- timestamp
                local ts = os.date("%Y%m%d%H%M%S")

                -- slugify helper
                local function slugify(s)
                    s = (s or "untitled")
                    -- lower, trim
                    s = s:lower():gsub("^%s+", ""):gsub("%s+$", "")
                    -- replace whitespace with '-', strip anything not alnum, dash, underscore
                    s = s:gsub("%s+", "-"):gsub("[^%w%-_]", "")
                    -- collapse multiple dashes
                    s = s:gsub("%-+", "-")
                    -- trim leading/trailing dashes
                    s = s:gsub("^%-+", ""):gsub("%-+$", "")
                    return s ~= "" and s or "untitled"
                end

                local slug = slugify(title)
                return string.format("%s--%s", ts, slug)
            end,
        },
        keys = {
            -- group header for which-key: <leader>o → +obsidian
            { "<leader>n",  "", desc = "+notes" },

            -- dailies & today
            { "<leader>n<space>n", "<cmd>Obsidian today<cr>",             desc = "Daily (today)" },
            { "<leader>n<space>t", "<cmd>Obsidian tomorrow<cr>",             desc = "Daily (tomorrow)" },
            { "<leader>n<space>y", "<cmd>Obsidian yesterday<cr>",             desc = "Daily (yesterday)" },
            { "<leader>n<space>d", "<cmd>Obsidian dailies -7 7<cr>",      desc = "Dailies (±14d)" },

            -- new notes / templates / quick switch
            { "<leader>nNN", "<cmd>Obsidian new<cr>",               desc = "New note" },
            { "<leader>nNT", "<cmd>Obsidian new_from_template<cr>", desc = "New from template" },
            { "<leader>nn", "<cmd>Obsidian quick_switch<cr>",      desc = "Quick switch" },

            -- search & tags
            { "<leader>ns", "<cmd>Obsidian search<cr>",            desc = "Search notes" },
            { "<leader>nT", "<cmd>Obsidian tags<cr>",              desc = "Tags picker" },

            -- open in Obsidian app (current or query)
            { "<leader>no", "<cmd>Obsidian open<cr>",              desc = "Open in Obsidian app" },

            -- backlinks / links / TOC (current buffer context)
            { "<leader>nb", "<cmd>Obsidian backlinks<cr>",         desc = "Backlinks" },
            { "<leader>nl", "<cmd>Obsidian links<cr>",             desc = "Links in note" },
            { "<leader>nc", "<cmd>Obsidian toc<cr>",               desc = "Table of contents" },

            -- follow link (kept on leader to avoid stomping your gf if you’ve remapped it)
            { "<leader>nf", "<cmd>Obsidian follow_link<cr>",       desc = "Follow link" },

            -- rename note (updates backlinks); also available via LSP rename if Oxide is attached
            -- { "<leader>or", "<cmd>Obsidian rename<cr>",            desc = "Rename note (update links)" },
            -- Use Oxide rename (updates links across the vault)
            { "<leader>nr", function() vim.lsp.buf.rename() end,  desc = "Oxide Rename (update links)" },

            -- images & templates (insert)
            { "<leader>np", "<cmd>Obsidian paste_img<cr>",         desc = "Paste image" },
            { "<leader>ni", "<cmd>Obsidian template<cr>",          desc = "Insert template" },

            -- workspaces (if you use more than one)
            { "<leader>nw", "<cmd>Obsidian workspace<cr>",         desc = "Switch workspace" },

            -- visual-mode helpers
            { "<leader>nl", ":Obsidian link<cr>",                  mode = "v", desc = "Link selection" },
            { "<leader>nL", ":Obsidian link_new<cr>",              mode = "v", desc = "Link selection as NEW note" },
            { "<leader>ne", ":Obsidian extract_note<cr>",          mode = "v", desc = "Extract selection → note" },
        },
    },

    ----------------------------------------------------------------
    -- LSP: Markdown-Oxide + blink.cmp capabilities (no cmp)
    ----------------------------------------------------------------
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            local util = require("lspconfig.util")
            opts.servers = opts.servers or {}

            -- keep marksman out of the ring
            opts.servers.marksman = { enabled = false }

            -- blink.cmp capabilities
            local blink_caps = require("blink.cmp").get_lsp_capabilities(
                vim.lsp.protocol.make_client_capabilities()
            )

            -- robust root_dir: handles bufnr or filename; pins vault root
            local function oxide_root_dir(arg)
                local fname = arg
                if type(arg) == "number" then
                    fname = vim.api.nvim_buf_get_name(arg)
                end
                fname = fname or vim.fn.expand("%:p")
                local vault = vim.fn.expand("~/Nextcloud/Oxide/default")
                if fname:sub(1, #vault) == vault then
                    return vault
                end
                return util.root_pattern(".obsidian", ".git")(fname) or util.path.dirname(fname)
            end

            opts.servers.markdown_oxide = {
                cmd = { "markdown-oxide" },      -- ensure in $PATH (AUR/Cargo)
                filetypes = { "markdown" },
                capabilities = blink_caps,
                single_file_support = true,
                root_dir = oxide_root_dir,
                on_attach = function(_, bufnr)
                    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename,
                        { buffer = bufnr, desc = "Oxide Rename (update links)" })
                    vim.keymap.set("n", "gR", vim.lsp.buf.references,
                        { buffer = bufnr, desc = "Oxide References/Backlinks" })
                end,
            }
        end,
    },
}
