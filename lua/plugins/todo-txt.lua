return {
  'arnarg/todotxt.nvim',
  requires = {'MunifTanjim/nui.nvim'},
  lazy = false,
  config = function ()
    require("todotxt-nvim").setup({
      todo_file = "/home/marty/Nextcloud/Task/todo.txt",
      sidebar = {
        width = 70,
        position = "right",
      },
    })
  end,
}
