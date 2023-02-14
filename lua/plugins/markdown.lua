return {
  {
    "npxbr/glow.nvim",
    ft = "markdown"
  },

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  {
    "elzr/vim-json",
    ft = "markdown",
  },
  {
    "plasticboy/vim-markdown",
    ft = "markdown",
    config = function ()
      vim.cmd([[
        " disable header folding
        let g:vim_markdown_folding_disabled = 1

        " do not use conceal feature, the implementation is not so good
        let g:vim_markdown_conceal = 0

        " disable math tex conceal feature
        let g:tex_conceal = ""
        let g:vim_markdown_math = 1

        " support front matter of various format
        let g:vim_markdown_frontmatter = 1  " for YAML format
        let g:vim_markdown_toml_frontmatter = 1  " for TOML format
        let g:vim_markdown_json_frontmatter = 1  " for JSON format
        ]])
    end
  },

  {
    "vim-pandoc/vim-pandoc-syntax",
    config = function()
      vim.cmd([[
         augroup pandoc_syntax
         au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
         augroup END
       ]])
    end

  }

}
