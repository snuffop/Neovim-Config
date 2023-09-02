-- requring Telescope
local installed, Telescope = pcall(require, "telescope")
if not installed then
	vim.notify("Plugin 'telescope' is not installed")
	return
end

-- requring telescope.actions
local installed, TelescopeActions = pcall(require, "telescope.actions")
if not installed then
	vim.notify("Plugin 'telescope' is not installed")
	return
end

-- #############################################################################
-- Setting Up Telescope
local actions = TelescopeActions
Telescope.setup({
	defaults = {
		layout_config = {
			width = 0.80,
			prompt_position = "bottom",
			preview_cutoff = 120,
			horizontal = { mirror = false },
			vertical = { mirror = false },
		},
		find_command = {
			"rg",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "  ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = {},
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default + actions.center,
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			},
		},
	},
	extensions = {
		project = {
			base_dirs = {
				{ "~/Source/" },
				{ "~/.local/share" },
			},
			hidden_files = true, -- default: false
			theme = "dropdown",
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true, -- default false
			-- default for on_project_selected = find project files
			on_project_selected = function(prompt_bufnr)
				-- Do anything you want in here. For example:
				project_actions.change_working_directory(prompt_bufnr, false)
				require("harpoon.ui").nav_file(1)
			end,
		},
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
			grouped = true,
			sorting_strategy = "ascending",
			default_selection_index = 2,
			mappings = {},
		},
		zoxide = {
			prompt_title = "zoxide: ",
		},
	},
})
