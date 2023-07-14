local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
  extensions = {
    fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case"
    }
  },
}

require('telescope').load_extension("packer")
require('telescope').load_extension("env")
require('telescope').load_extension("file_browser")
require('telescope').load_extension("find_pickers")
require('telescope').load_extension("glyph")
require('telescope').load_extension("luasnip")
require('telescope').load_extension("media_files")
require('telescope').load_extension("zoxide")
require('telescope').load_extension('fzf')
