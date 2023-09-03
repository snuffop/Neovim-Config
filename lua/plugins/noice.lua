-- Noice
local installed, Noice = pcall(require, "noice")
if not installed then
	vim.notify("Plugin 'noice' is not installed")
	return
end

require("notify").setup({
	background_colour = "#000000",
})

Noice.setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
})
