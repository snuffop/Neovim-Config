local status_ok, rnvimr = pcall(require, "rnvimr")
if not status_ok then
  return
end

vim.g.rnvimr_draw_border = 1
vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_bw_enable = 1
vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_bw = 1
vim.g.rnvimr_hide_gitignore = 1

rnvimr.setup()

