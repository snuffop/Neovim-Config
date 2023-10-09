require("core.lazy")
require("core.keymaps")
require("core.options")
require("core.autocommands")

-- for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/thisBetterWork/remaps', [[v:val =~ '\.lua$']])) do
--    require('thisBetterWork.remaps.' .. file:gsub('%.lua$', ''))
--end
--
---- [[ Highlight on yank ]]
---- See `:help vim.highlight.on_yank()`
--local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
--vim.api.nvim_create_autocmd('TextYankPost', {
--  callback = function()
--    vim.highlight.on_yank()
--  end,
--  group = highlight_group,
--  pattern = '*',
--})
