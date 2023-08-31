return {
    {
        'preservim/vim-markdown',
        dependencies = {
            'godlygeek/tabular',
        },
        init = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_math = 1
            vim.g.vim_markdown_frontmatter = 1
            vim.g.vim_markdown_toml_frontmatter = 1
            vim.g.vim_markdown_json = 1
            vim.g.vim_markdown_new_list_item_indent = 0
            vim.g.vim_markdown_no_extensions_in_markdown = 1
        end,
    }
}
