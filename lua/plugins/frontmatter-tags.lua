--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- ~/.config/nvim/lua/plugins/frontmatter-tags.lua
return {
  {
  --   -- no external plugin; just your helper module & commands
  --   "lazyvim.frontmatter-tags",
  --   dev = true,
  --   config = function()
  --     local fm = require("fm_tags")
  --
  --     -- :FMAddTag and :FMRemoveTag
  --     vim.api.nvim_create_user_command("FMAddTag", function(opts)
  --       if opts.args ~= "" then fm.add_tag(opts.args) else fm.prompt_add() end
  --     end, { nargs = "?", complete = "file" })
  --
  --     vim.api.nvim_create_user_command("FMRemoveTag", function(opts)
  --       if opts.args ~= "" then fm.remove_tag(opts.args) else fm.prompt_remove() end
  --     end, { nargs = "?" })
  --
  --     -- Keymaps (normal mode)
  --     -- <leader>ta => add tag (prompt), <leader>tr => remove tag (picker)
  --     vim.keymap.set("n", "<leader>zta", fm.prompt_add, { desc = "Frontmatter: Add Tag" })
  --     vim.keymap.set("n", "<leader>ztr", fm.prompt_remove, { desc = "Frontmatter: Remove Tag" })
  --   end,
  -- },
}
