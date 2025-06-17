--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- DENOTE Link type

function find_files_starting_with(prefix, dir)
    dir = dir or "."
    local cmd = string.format("ls -1 %s", dir)
    local handle = io.popen(cmd)
    local result = {}
    if handle then
        for file in handle:lines() do
            if file:sub(1, #prefix) == prefix then
                table.insert(result, file)
            end
        end
        handle:close()
    end
    return result
end

local LinkDenoteType = {}

--- @return string
function LinkDenoteType.get_name()
    return 'denote'
end

---@param ling string - The Current value of the link
---@return boolean - When true, link was handled, when false, continue to the next source
function LinkDenoteType:follow(link)
    if not vim.startswith(link, 'denote:') then
        return false
    end
    local identifier = link:sub(8)
    --  vim.cmd( "e" .. identifier)
    denotefilename = find_files_starting_with(identifier, '/home/marty/Nextcloud/Org') 

    for _, f in ipairs(denotefilename) do print(f) end

    return true
end

---@param link string - The current value of the link, for example: "ping:go"
---@return string[]
function LinkDenoteType:autocomplete(link)
    local items = {}
    return vim.tbl_filter(function(item) return vim.startswith(item, link) end, items)
end


return {
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        dependencies = {
            "danilshvalov/org-modern.nvim",
            'nvim-telescope/telescope.nvim',
            'nvim-orgmode/telescope-orgmode.nvim',
            'nvim-orgmode/org-bullets.nvim',
        },
        config = function() 
            local Menu = require("org-modern.menu")
            require("orgmode").setup({
                emacs_config = "~/.config/doom/config.el",
                org_agenda_files = '~/Nextcloud/Org/Orgzly/**/*',
                org_default_notes_file = '~/Nextcloud/Org/Orgzly/Inbox.org',
                org_todo_keywords = {"TODO(t)", "STARTED(s)", "WAITING(w)", "DELEGATED(D)", "|", "ASSIGNED(a)", "CANCELLED(c)", "DONE(d)"},
                org_todo_keyword_faces = {
                    TODO       = ':foreground red     :weight bold',
                    STARTED    = ':foreground #E35DBF :weight bold',
                    WAITING    = ':foreground #008080 :weight bold',
                    WAIT       = ':foreground #008080 :weight bold',
                    DELEGATED  = ':foreground pink    :weight bold',
                    CANCELLED  = ':foreground white   :weight bold',
                    ASSIGNED   = ':foreground white   :weight bold',
                    DONE       = ':foreground green   :weight bold',
                },
                org_startup_folded = "content",
                org_startup_indented = true,
                org_log_done = 'time',
                org_hide_leading_stars = true,
                org_log_repeat = true,
                org_log_into_drawer = {"LOGBOOK"} ,
                ui = {
                    menu = {
                        handler = function(data)
                            Menu:new({
                                window = {
                                    margin = { 1, 0, 1, 0 },
                                    padding = { 0, 1, 0, 1 },
                                    title_pos = "center",
                                    border = "single",
                                    zindex = 1000,
                                },
                                icons = {
                                    separator = "➜",
                                },
                            }):open(data)
                        end,
                    },
                },
                mappings = {
                    global = {
                        org_capture = {'gC', desc = "Org Capture"},
                    },
                    capture = {
                        org_capture_finalize = "<C-c><C-c>",
                    },
                    org = {
                        org_refile = {"<localleader>r", desc = "Refile"},
                        org_clock_in = {"<localleader>ci", desc = "Clock In"},
                        org_clock_out = {"<localleader>co", desc = "Clock Out"},
                        org_clock_cancel = {"<localleader>cc", desc = "Clock Cancel"},
                        org_clock_goto = {"<localleader>cj", desc = "Clock Goto"},
                        org_todo = {"<localleader>tt", desc = "Org TODO"},
                        org_todo_prev = "<localleader>tT",
                        org_change_date = "<localleader>td",
                        org_priority_up = "<localleader>tR",
                        org_priority_down = "<localleader>tr",
                    }
                },
                hyperlinks = {
                    sources = {
                        LinkDenoteType,
                        {
                            get_name = function() return 'my_custom_type' end,
                            follow = function(self, link) print('Following link:', link) return true end,
                            autocomplete = function(self, link) return {'my_custome_type:my_custome_link'} end
                        }
                    }
                }
            })
            require('org-bullets').setup()
            require('blink.cmp').setup({
                sources = {
                    per_filetype = {
                        org = {'orgmode'}
                    },
                    providers = {
                        orgmode = {
                            name = 'Orgmode',
                            module = 'orgmode.org.autocompletion.blink',
                            fallbacks = { 'buffer' },
                        },
                    },
                },
            })
            require('telescope').setup()
            require('telescope').load_extension('orgmode')
            vim.keymap.set('n', '<leader>r', require('telescope').extensions.orgmode.refile_heading)
            vim.keymap.set('n', '<leader>fh', require('telescope').extensions.orgmode.search_headings)
            vim.keymap.set('n', '<leader>li', require('telescope').extensions.orgmode.insert_link)
        end,
    },
    {
        "0xzhzh/fzf-org.nvim",
        lazy = false, -- lazy loading is handled internally
        dependencies = {
            "ibhagwan/fzf-lua",
            "nvim-orgmode/orgmode",
        },
        keys = {
            -- example keybindings
            { "<leader>og", function() require("fzf-org").orgmode() end, desc = "org-browse" },
            { "<leader>of", function() require("fzf-org").files() end, desc = "org-files" },
            { "<leader>orr", function() require("fzf-org").refile() end, desc = "org-refile" },
            { "<leader>orh", function() require("fzf-org").refile_to_headline() end, desc = "org-refile to headline" },
            { "<leader>orf", function() require("fzf-org").refile_to_file() end, desc = "org-refile to file" },
        },
        config = function()
            require("fzf-org").setup { } -- see below
        end,
    },
}
