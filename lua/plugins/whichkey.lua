-- requring plugin
local installed, WhichKey = pcall(require, "which-key")
if not installed then
	vim.notify("Plugin 'which-key' is not installed")
	return
end

-- requring plugin
local installed, ToggleTerm = pcall(require, "toggleterm.terminal")
if not installed then
	vim.notify("Plugin 'toggleterm' is not installed")
	return
end

-- ##################################################################################################

local wk = WhichKey

local Terminal = ToggleTerm.Terminal
local toggle_float = function()
	local float = Terminal:new({ direction = "float" })
	return float:toggle()
end

local toggle_lazygit = function()
	local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
	return lazygit:toggle()
end

WhichKey.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ...
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	operators = { gc = "Comments" },
	motions = {
		count = true,
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-j>", -- binding to scroll down inside the popup
		scroll_up = "<c-k>", -- binding to scroll up inside the popup
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
		padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
		zindex = 1000, -- positive value to position WhichKey above other floating windows.
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
	show_help = true, -- show a help message in the command line for using WhichKey
	show_keys = true, -- show the currently pressed key and its label as a message in the command line
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

-- ##################################################################################################
-- Keymaps

local wkopts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {

	["/"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },

	DD = { ":Alpha<cr>", "StartPage" },
	a = {
		name = "+Application",
		a = { "<cmd>Alpha<cr>", "Alpha" },
		m = { "<cmd>Neomutt<cr>", "Neomutt" },
		n = { "<cmd>Nnn<cr>", "Nnn toggle" },
		l = {
			name = "Lazy",
			s = { "<cmd>Lazy sync<cr>", "Sync" },
			i = { "<cmd>Lazy install<cr>", "Install" },
			p = { "<cmd>Telescope lazy<cr>", "Telescope" },
			l = { "<cmd>Lazy<cr>", "Status" },
		},
		t = {
			name = "+ToDotxt",
			t = { "<cmd>ToDoTxtTasksToggle<cr>", "Toggle Window" },
		},
	},

	b = {
		name = "+Buffers",
		b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
		d = { "<cmd>Bdelete<cr>", "Delete Buffer" },
		l = { ":lua require('telescope.builtin').buffers()<cr>", "List" },
		p = { "<cmd>BufferLineTogglePin<cr>", "Toggle Pin" },
		s = { "<cmd>BufferLinePick<cr>", "Select" },
		w = { "<cmd>Bwipeout<cr>", "Wipeout  Buffer" },
	},

	c = {
		name = "+Code",
		m = { "<cmd>:Mason<cr>", "Mason" },
		i = { "<cmd>:Inspect<cr>", "TS Inspect" },
		t = { "<cmd>:TagbarToggle<cr>", "Tagbar toggle" },
		I = { "<cmd>:TSInstallInfo<cr>", "TS Install Info" },
	},

	d = {
		name = "+dired",
		j = { "<cmd>Oil<cr>", "Oil Dired Jump" },
	},

	f = {
		name = "+File",
		b = { "<cmd>Telescope file_browser<cr>", "Telescope file_browser" },
		c = { "<cmd>lua require('telescope.builtin').find_files({cwd = '~/.config/nvim/'})<cr>", "Find Config Files" },
		d = { "<cmd>Oil<cr>", "Oil " },
		e = { "<cmd>NvimTreeToggle<cr>", "Nvim-Tree" },
		f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
		g = { "<cmd>Telescope git_files<cr>", "Git File" },
		o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		r = { "<cmd>Ranger<cr>", "Ranger Vim" },
		s = { "<cmd>up<cr><esc>", "Save File" },
		S = { "<cmd>:w !sudo tee %<cr><esc>", "Sudo Save File" },
		v = { "<cmd>Explore<cr>", "Netrw" },
		z = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
	},

	g = {
		name = "+Git",
		L = { "<cmd>LazyGit<cr>", "Lazygit" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		B = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
		f = { "<cmd>Telescope git_files<cr>", "Git File" },
		g = { "<cmd>Neogit<cr>", "Neogit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		s = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
	},

	h = {
		name = "+Help",
		n = {
			name = "+Noice",
			l = { "<cmd>Noice last<cr>", "Noice Last Message" },
			h = { "<cmd>Noice history<cr>", "Noice History" },
			a = { "<cmd>Noice all<cr>", "Noice All" },
			e = { "<cmd>Noice dismiss<cr>", "Noice Dismiss All" },
		},
	},

	l = {
		name = "LSP",
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		m = { "<cmd>Mason<cr>", "Mason" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
	},
	-- Lsp Stuffs
	-- l = {
	-- 	name = "LSP",
	-- 	i = { ":LspInfo<cr>", "Connected Language Servers" },
	-- 	k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
	-- 	K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
	-- 	w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
	-- 	W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
	-- 	l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folders" },
	-- 	t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
	-- 	d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
	-- 	D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
	-- 	r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
	-- 	R = { "<cmd>Lspsaga rename<cr>", "Rename" },
	-- 	a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
	-- 	e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
	-- 	n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
	-- 	N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
	-- },
	m = {
		name = "+Harpoon",
		m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file" },
		t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
		a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
		s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
		d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
		f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
		g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
		q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
		w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
		e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
		r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
		n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
		p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
	},

	n = {
		name = "+Notes",
		n = { "<cmd>Neorg index<cr>", "Neorg Index" },
		r = { "<cmd>Neorg return<cr>", "Neorg Return" },
		F = { "<cmd>Telescope neorg search_headings<cr>", "Search Headings" },
		f = { "<cmd>Telescope neorg find_linkable<cr>", "Search linkable" },
		j = {
			name = "Neorg Journal",
			j = { "<cmd>Neorg journal today<cr>", "Today" },
			t = { "<cmd>Neorg journal tomorrow<cr>", "Tomorrow" },
			y = { "<cmd>Neorg journal yesterday<cr>", "Yesterday" },
			c = { "<cmd>Neorg journal custom", "Custom" },
			T = { "<cmd>Neorg journal template<cr>", "Template" },
		},
		x = {
			name = "Neorg tool",
			s = { "<cmd>Neorg generate-workspace-summary<cr>", "Neorg Summary" },
			i = { "<cmd>Neorg inject-metadata<cr>", "Inject Metadata" },
			u = { "<cmd>Neorg update-metadata<cr>", "Update Metadata" },
		},
		-- o = {
		--     name = "Obsidian",
		--     C = { "<cmd>ObsidianCheckHealth<cr>", "Check Health" },
		--     T = { "<cmd>ObsidianTomorrow<cr>", "Open Tomorrow" },
		--     b = { "<cmd>ObsidianBacklinks<cr>", "Find Backlinks" },
		--     c = { "<cmd>ObsidianCheck<cr>", "Check" },
		--     f = { "<cmd>ObsidianFollowLink<cr>", "Follow Link" },
		--     l = { "<cmd>ObsidianLink<cr>", "Link" },
		--     n = { "<cmd>ObsidianNew<cr>", "New Note" },
		--     o = { "<cmd>ObsidianOpen<cr>", "Open" },
		--     s = { "<cmd>ObsidianQuickSwitch<cr>", "Quick Switch" },
		--     g = { "<cmd>ObsidianSearch<cr>", "Search" },
		--     t = { "<cmd>ObsidianToday<cr>", "Open Today" },
		--     y = { "<cmd>ObsidianYesterday<cr>", "Open Yesterday" },
		--     m = { "<cmd>ObsidianTemplate<cr>", "Add Template" },
		-- },
		w = {
			name = "Workspace",
			n = { "<cmd>Neorg workspace notes<cr>", "Notes workspace" },
			j = { "<cmd>Neorg workspace joyent<cr>", "Joyent workspace" },
		},
		z = {
			name = "Zettelkasten",
			I = { "<cmd>ZkIndex<cr>", "ZK Index" },
			N = { "<cmd>ZkNew<cr>", "ZK New" },
			c = { "<cmd>ZkCd<cr>", "ZK CD" },
			n = { "<cmd>ZkNotes<cr>", "ZK Notes Picker" },
			b = { "<cmd>ZkBacklinks<cr>", "ZK Backlinks" },
			l = { "<cmd>ZkLinks<cr>", "ZK Links" },
			i = { "<cmd>ZkInsertLink<cr>", "ZK Insert Links" },
			j = {
				name = "Journals",
				j = { "<cmd>ZkNew { dir = 'journals', date = 'today' }<cr>", "ZK Journal Today" },
				y = { "<cmd>ZkNew { dir = 'journals', date = 'yesterday' }<cr>", "ZK Journal Yesterday" },
				t = { "<cmd>ZkNew { dir = 'journals', date = 'tomorrow' }<cr>", "ZK Journal Tomorrow" },
			},
		},
	},

	o = {
		name = "+Open",
		m = {
			name = "My",
			t = { "<cmd>e ~/Nextcloud/Obsidian/todo/todo.txt<cr>", "Todo Txt" },
			w = { "<cmd>e ~/.config/nvim/after/plugin/whichkey.lua<cr>", "NVIM WhichKey" },
			c = { "<cmd>e ~/.config/nvim/init.lua<cr>", "NVIM Config" },
		},
	},

	p = {
		name = "+projects",
		p = { "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>", "Projects" },
		f = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Project files" },
	},

	q = {
		name = "+quit",
		q = { "<cmd>q!<CR>", "Quit" },
	},

	s = {
		name = "Search",
		B = { "<cmd>Telescope builtin<cr>", "Builtin" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		F = { "<cmd>Telescope filetypes<cr>", "filetypes" },
		H = { "<cmd>Telescope highlights<cr>", "highlights" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		e = { "<cmd>Telescope env<cr>", "Environment" },
		f = { "<cmd>Telescope find_pickers<cr>", "list pickers" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		o = { "<cmd>Telescope vim_options<cr>", "Options" },
		r = { "<cmd>Telescope resume<cr>", "Resume" },
		q = { "<cmd>Telescope quickfix<cr>", "Resume" },
		y = { "<cmd>Telescope glyph<cr>", "Glyph" },
	},

	S = {
		name = "+Source",
		["."] = { "<cmd>source %<cr>", "Source Current File" },
		s = { "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua<CR>", "Source Snippets" },
	},
	-- Terminal
	T = {
		t = { ":ToggleTerm<cr>", "Split Below" },
		f = { toggle_float, "Floating Terminal" },
		l = { toggle_lazygit, "LazyGit" },
	},
	t = {
		name = "Toggle",
		c = { "<cmd>Neorg toggle-concealer<cr>", "Toggle Concealer" },
		b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Gitsign Blame" },
		d = { "<cmd>Gitsigns toggle_deleted<cr>", "Toggle Gitsign Deleted" },
		t = {
			name = "Toggle Terminal",
			f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
			h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
			v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		},
		u = { "<cmd>UndotreeToggle<cr>", "undo tree" },
	},

	w = {
		name = "Wiki",
		f = { "<cmd>Telescope vimwiki<CR>", "Vimwiki files" },
		p = { "<cmd>lua require('telescope').extensions.vimwiki.vimwiki()<cr>", "Vimwiki Search Page Names" },
		l = { "<cmd>Telescope vimwiki link<CR>", "Vimwiki Insert Link" },
		["/"] = { "<cmd> Telescope vimwiki live_grep<CR>", "Vimwiki Live Grep" },
	},

	W = {
		name = "+Windows",
		h = { "<C-w>|", "Maximize window horizontally (|)" },
		v = { "<C-w>_", "Maximize window vertically (_)" },
		["="] = { "<C-w>=", "Resize windows equally" },
		s = { ":lua require('telescope-tabs').list_tabs()<cr>", "Search Tabs" },
		t = { "<cmd>WhichKey<cr>", "Whichkey Top Level" },
	},

	x = {
		c = { "<cmd>!chmod +x %<CR>", "chmod" },
	},
}

wk.register(mappings, wkopts)
