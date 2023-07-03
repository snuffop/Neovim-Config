return {
  'arnarg/todotxt.nvim',
  requires = {'MunifTanjim/nui.nvim'},
  lazy = false,
  config = function ()
    require("todotxt-nvim").setup({
      todo_file = "/home/marty/Nextcloud/Obsidian/todo/todo.txt",
    })
  end,
}
