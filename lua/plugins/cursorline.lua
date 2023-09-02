-- requring plugin
local installed, CursorLine = pcall(require, "nvim-cursorline")
if not installed then
	vim.notify("Plugin 'nvim-comment' not installed")
	return
end

CursorLine.setup({
	cursorline = {
		enable = true,
		timeout = 1000,
		number = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	},
})
