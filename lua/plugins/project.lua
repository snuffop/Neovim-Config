return {
    {
        'ahmedkhalf/project.nvim',
        config = function()
            require('project_nvim').setup{
                silent_chdir = false,
            }
            require("nvim-tree").setup({
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = true
                },
            })
            require('telescope').load_extension('projects')
        end
    }
}
