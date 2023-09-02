-- requring plugin
local installed, TreeSitter = pcall(require, "nvim-treesitter.configs")
if not installed then
	vim.notify("Plugin 'treesitter' is not installed")
	return
end
-- Setting up Treesitter
TreeSitter.setup({
	ensure_installed = {
		"bash",
		"c",
		"comment",
		"css",
		"html",
		"http",
		"jq",
		"json",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"norg",
		"python",
		"regex",
		"ruby",
		"rust",
		"sql",
		"terraform",
		"todotxt",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	sync_install = false,
	auto_install = true,
	indent = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	autotag = {
		enable = true,
	},

	autopairs = {
		enable = true,
	},

	tree_docs = {
		enabled = true,
	},

	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 5000,
	},

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
