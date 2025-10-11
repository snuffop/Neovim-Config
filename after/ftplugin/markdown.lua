-- Add the key mappings only for Markdown files in a zk notebook.
if require("zk.util").notebook_root(vim.fn.expand('%:p')) ~= nil then
    local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
    local opts = { noremap=true, silent=false }

    -- Open the link under the caret.
    map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("i", "<C-S-i>", "<Cmd>ZkInsertLink<CR>", opts)
    -- Preview a linked note.
    map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

-- after/ftplugin/markdown.lua
vim.opt_local.conceallevel = 2
vim.opt_local.concealcursor = "nc"

vim.cmd [[
  " Conceal the URL part of [text](url)
  syn match ZkHideLinkParen /\[[^]]\+]\zs([^)\r\n]*)/ conceal containedin=ALL
  highlight default link ZkHideLinkParen Conceal
]]
