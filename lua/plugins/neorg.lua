return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  priority = 100,
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.norg.manoeuvre"] = {},
      ["core.export"] = {},
      ["core.export.markdown"] = {},
      ["core.integrations.telescope"] = {},
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp"
        }
      },
      ["core.norg.journal"] = {
        config = {
          workspace = 'default',
        }
      },
      ["core.norg.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            default = "~/Nextcloud/neorg/default",
            joyent = "~/Nextcloud/neorg/joyent",
          },
          index = 'index.norg'
        },
      },
    },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-neorg/neorg-telescope"},
  },
}
