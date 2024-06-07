-- Neotree Options mod from lazyvim norms
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {

        ["e"] = function()
          vim.api.nvim_exec2("Neotree focus filesystem left", true)
        end,

        ["b"] = function()
          vim.api.nvim_exec2("Neotree focus buffers left", true)
        end,
        ["g"] = function()
          vim.api.nvim_exec2("Neotree focus git_status left", true)
        end,

        ["<tab>"] = function(state)
          local node = state.tree:get_node()
          if require("neo-tree.utils").is_expandable(node) then
            state.commands["toggle_node"](state)
          else
            state.commands["open"](state)
            vim.cmd("Neotree reveal")
          end
        end,

        ["h"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" and node:is_expanded() then
            require("neo-tree.sources.filesystem").toggle_directory(state, node)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,

        ["l"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" then
            if not node:is_expanded() then
              require("neo-tree.sources.filesystem").toggle_directory(state, node)
            elseif node:has_children() then
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          end
        end,
      },
    },
  },
}
