local status_ok, todotxt = pcall(require, "todotxt-nvim")
if not status_ok then
  return
end

todotxt.setup({
    todo_file = "/home/marty/Nextcloud/Task/todo.txt",
    sidebar = {
        width = 70,
        position = "right",
    },
})
