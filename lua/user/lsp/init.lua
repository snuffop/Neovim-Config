local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
-- require "user.lsp.null-ls"

-- require'lspconfig'.grammarly.setup{}
-- require'lspconfig'.marksman.setup{}
-- require'lspconfig'.ansiblels.setup{}
-- require'lspconfig'.bashls.setup{}
-- require'lspconfig'.stylelint_lsp.setup{}
-- require'lspconfig'.terraform_lsp.setup{}
-- require'lspconfig'.yamlls.setup{}
-- require'lspconfig'.zk.setup{}
