return{
    'ahmedkhalf/project.nvim',
    lazy = false,
    config = function()
        require('telescope').load_extension('projects')
    end
}

