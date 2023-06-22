return {
  {
    'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup_ts_grammar()

      require('nvim-treesitter.configs').setup {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = {'org'},
        },
        ensure_installed = {'org'}, -- Or run :TSUpdate org
      }

      require('orgmode').setup({
        org_agenda_files = {'~/Nextcloud/Notes/org/*', '~/Nextcloud/Notes/org/orgzly/*'},
        org_default_notes_file = '~/Nextcloud/Notes/org/orgzly/0mobile.org',
      })
    end,
    dependencies = {
      {'nvim-treesitter/nvim-treesitter'},
    },
  },
}
