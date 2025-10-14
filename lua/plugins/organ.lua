--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- Orgmode type demote and promote for markdown

return {
  "chimay/organ",
  ft = "markdown",
  config = function()
    vim.keymap.set("n", "<A-h>", ":Organ promote<cr>", { noremap = true, silent = true, desc = "Promote Markdown header" })
    vim.keymap.set("n", "<A-S-h>", ":Organ promote-subtree<cr>", { noremap = true, silent = true, desc = "Promote Markdown subtree" })
    vim.keymap.set("n", "<A-l>", ":Organ demote<cr>", { noremap = true, silent = true, desc = "Demote Markdown header" })
    vim.keymap.set("n", "<A-S-l>", ":Organ demote-subtree<cr>", { noremap = true, silent = true, desc = "Demote Markdown subtree" })
  end,
}
