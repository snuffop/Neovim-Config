--  ╭──────────────────────────────────────────────────────────╮
--  │ Obsidian.nvim + Markdown-Oxide                           |
--  ╰──────────────────────────────────────────────────────────╯

local function oxide_move_to(subdir)
  local src = vim.fn.expand("%:p")
  if src == "" then
    vim.notify("No filename (unsaved buffer)", vim.log.levels.WARN)
    return
  end

  -- run the external script
  local cmd = { "oxide-mv.sh", src, subdir }
  local out = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    vim.notify("Move failed: " .. out, vim.log.levels.ERROR)
    return
  end

  local newpath = vim.fn.trim(out)
  if newpath == "" then
    vim.notify("Move returned no path", vim.log.levels.WARN)
    return
  end

  -- edit the new file and close the old buffer
  local oldbuf = vim.api.nvim_get_current_buf()
  vim.cmd("edit " .. vim.fn.fnameescape(newpath))
  local newbuf = vim.api.nvim_get_current_buf()

  if oldbuf ~= newbuf then
    pcall(vim.api.nvim_buf_delete, oldbuf, { force = true })
  end

  vim.notify("Moved to " .. newpath, vim.log.levels.INFO)
end

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
                enable = false,
            },

            -- disable UI to not clash with  markdown-nvim
            ui = {
                enable = false,
            },

            workspaces = {
                { name = "default", path = "~/Nextcloud/Oxide/default" },
            },

            attachments = {
                folder = "Attach/{{title}}",
            },

            notes_subdir = "Inbox",

            disable_frontmatter = false,

            legacy_commands = false,

            daily_notes = {
                folder = "journals",
                date_format = "%Y-%m-%d",
                template = "daily.md",
            },

            templates = {
                folder = "Templates",
                substitutions = {
                    date = function()
                        return os.date("%Y-%m-%d")
                    end,
                    time = function()
                        return os.date("%H:%M")
                    end,
                    fulldate = function()
                        local d = os.date("*t")
                        local day = os.date("%A", os.time(d))
                        local month = os.date("%B", os.time(d))
                        local day_num = tonumber(os.date("%d", os.time(d)))
                        local suffix = (day_num % 10 == 1 and day_num ~= 11 and "st")
                        or (day_num % 10 == 2 and day_num ~= 12 and "nd")
                        or (day_num % 10 == 3 and day_num ~= 13 and "rd")
                        or "th"
                        return string.format("%s %s %d%s %d", day, month, day_num, suffix, d.year)
                    end,
                },
            },

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
            { "<leader>n", "", desc = "+notes" },

            -- dailies & today
            { "<leader>n<space>n", "<cmd>Obsidian today<cr>", desc = "Daily (today)" },
            { "<leader>n<space>t", "<cmd>Obsidian tomorrow<cr>", desc = "Daily (tomorrow)" },
            { "<leader>n<space>y", "<cmd>Obsidian yesterday<cr>", desc = "Daily (yesterday)" },
            { "<leader>n<space>d", "<cmd>Obsidian dailies -7 7<cr>", desc = "Dailies (±14d)" },

            -- new notes / templates / quick switch
            { "<leader>nNN", "<cmd>Obsidian new<cr>", desc = "New note" },
            { "<leader>nNT", "<cmd>Obsidian new_from_template<cr>", desc = "New from template" },
            { "<leader>nn", "<cmd>Obsidian quick_switch<cr>", desc = "Quick switch" },

            -- search & tags
            { "<leader>n/", "<cmd>Obsidian search<cr>", desc = "Search notes" },
            { "<leader>nT", "<cmd>Obsidian tags<cr>", desc = "Tags picker" },

            -- open in Obsidian app (current or query)
            { "<leader>no", "<cmd>Obsidian open<cr>", desc = "Open in Obsidian app" },

            -- backlinks / links / TOC (current buffer context)
            { "<leader>nb", "<cmd>Obsidian backlinks<cr>", desc = "Backlinks" },
            { "<leader>nl", "<cmd>Obsidian links<cr>", desc = "Links in note" },
            { "<leader>nO", "<cmd>Obsidian toc<cr>", desc = "Outline Picker" },
            { "<leader>nc", "<cmd>Obsidian check<cr>", desc = "Obsidian Check" },

            -- follow link (kept on leader to avoid stomping your gf if you’ve remapped it)
            { "<leader>nf", "<cmd>Obsidian follow_link<cr>", desc = "Follow link" },

            -- rename note (updates backlinks); also available via LSP rename if Oxide is attached
            -- { "<leader>or", "<cmd>Obsidian rename<cr>",            desc = "Rename note (update links)" },
            -- Use Oxide rename (updates links across the vault)
            {
                "<leader>nr",
                function()
                    vim.lsp.buf.rename()
                end,
                desc = "Oxide Rename (update links)",
            },

            -- images & templates (insert)
            { "<leader>np", "<cmd>Obsidian paste_img<cr>", desc = "Paste image" },
            { "<leader>ni", "<cmd>Obsidian template<cr>", desc = "Insert template" },

            -- workspaces (if you use more than one)
            { "<leader>nw", "<cmd>Obsidian workspace<cr>", desc = "Switch workspace" },

            -- visual-mode helpers
            { "<leader>nl", ":Obsidian link<cr>", mode = "v", desc = "Link selection" },
            { "<leader>nL", ":Obsidian link_new<cr>", mode = "v", desc = "Link selection as NEW note" },
            { "<leader>ne", ":Obsidian extract_note<cr>", mode = "v", desc = "Extract selection → note" },

            { "<leader>nm", "", desc = "+Move/Modify" },

            { "<leader>nmb", function() oxide_move_to("Resource/Bookmark") end, desc = "Move note → Resource/Bookmark" },
            { "<leader>nmh", function() oxide_move_to("Area/Homelab") end, desc = "Move note → Area/Homelab" },
            { "<leader>nmi", function() oxide_move_to("Area/Inventory") end, desc = "Move note → Area/Inventory" },
            { "<leader>nmj", function() oxide_move_to("Area/Joyent") end, desc = "Move note → Area/Joyent" },
            { "<leader>nml", function() vim.cmd([=[%s/\[\[\(https[^]]*\)\]\[\([^]]*\)\]\]/[\2](\1)/g]=]) end, desc = "Convert Org→MD links" },
            { "<leader>nml", function() vim.cmd([=['<,'>s/\[\[\(https[^]]*\)\]\[\([^]]*\)\]\]/[\2](\1)/g]=]) end, mode = "v", desc = "Convert Org→MD links (selection)" },
            { "<leader>nmp", function() oxide_move_to("Resource/Corporation") end, desc = "Move note → Resource/Corporation" },
            { "<leader>nmp", function() oxide_move_to("Resource/People") end, desc = "Move note → Resource/People" },
            { "<leader>nmr", function() oxide_move_to("Resource") end, desc = "Move note → Resource" },
            { "<leader>nmt", function() oxide_move_to("Resource/TipJar") end, desc = "Move note → Resource/TipJar" },
            { "<leader>nmu", function() oxide_move_to("Area/Utilities") end, desc = "Move note → Area/Utilities" },
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
            local blink_caps = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

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
                return util.root_pattern(".obsidian", ".git")(fname) or vim.fs.dirname(fname)
            end

            opts.servers.markdown_oxide = {
                cmd = { "markdown-oxide" },
                filetypes = { "markdown" },
                capabilities = blink_caps,
                single_file_support = true,
                root_dir = oxide_root_dir,
                on_attach = function(_, bufnr)
                    vim.keymap.set("n", "gR", vim.lsp.buf.references, { buffer = bufnr, desc = "Oxide References/Backlinks" })
                end,
            }
        end,
    },
}
