--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

----------------------------------------------------------------------
--                          Direnv Support                          --
--   https://github.com/direnv/direnv.vim?tab=readme-ov-file        --
----------------------------------------------------------------------

-- return {
--     "direnv/direnv.vim",
--     lazy = false,
-- }

-- lets try  https://github.com/NotAShelf/direnv.nvim
return{
  "NotAShelf/direnv.nvim",
  config = function()
    require("direnv").setup({})
  end,
}
