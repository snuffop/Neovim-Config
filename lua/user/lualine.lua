local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local buffers = {
  "buffers",
  show_filename_only = false,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 1,
}

local filename = {
  "filename",
  path = 1,
}
local lsp = {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { branch, 'fileformat', filetype, },
		lualine_c = { filename },
		lualine_x = { diff, diagnostics },
		lualine_y = { location, lsp },
		lualine_z = { 'progress', 'encoding' },
	},
	inactive_sections = {
		lualine_a = { filename },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {diagnostics},
	},
	tabline = {
    lualine_a = { buffers },
  },
	extensions = {},
})
