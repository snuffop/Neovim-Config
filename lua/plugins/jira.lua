--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- JIRA https://github.com/WillianPaiva/jira-nvim?tab=readme-ov-file#installation

if vim.uv.os_gethostname() == "archzen" or vim.uv.os_gethostname() == "archovo" then

local JIRA_URL = os.getenv("JIRA_DOMAIN") 
local JIRA_EMAIL = os.getenv("JIRA_USER") 
local JIRA_API_TOKEN = os.getenv("JIRA_API_TOKEN") 

return {
  {
    "WillianPaiva/jira-nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim", -- For future async operations
    },
    opts = {
      jira_url = JIRA_URL,
      jira_email = JIRA_EMAIL,
      jira_api_token = JIRA_API_TOKEN,
      project_key = "SYSOPS",                         -- Default project key (optional)
      use_floating_window = true,
      window_width = 0.8,
      window_height = 0.8,
      keymaps = {
        close = "q",
        refresh = "<C-r>",
        open_browser = "<CR>",
        view_issue = "v",
        transition_issue = "t"
      }
    },
    keys = {
      -- Dashboard
      { "<leader>jd", "<cmd>JiraDashboard<cr>", desc = "Jira Dashboard" },
      
      -- Issue management
      { "<leader>ji", "<cmd>JiraIssueList<cr>", desc = "List Issues (Filter)" },
      { "<leader>jI", function() require("jira-nvim.form").my_issues() end, desc = "My Issues" },
      { "<leader>jT", function() require("jira-nvim.form").my_todo_issues() end, desc = "My TODO Issues" },
      { "<leader>jP", function() require("jira-nvim.form").my_in_progress_issues() end, desc = "My In Progress" },
      { "<leader>jr", function() require("jira-nvim.form").recent_issues() end, desc = "Recent Issues" },
      { "<leader>ju", function() require("jira-nvim.form").unassigned_issues() end, desc = "Unassigned Issues" },
      { "<leader>jh", function() require("jira-nvim.form").high_priority_issues() end, desc = "High Priority Issues" },
      { "<leader>jv", function() 
          vim.ui.input({
            prompt = "Issue Key: ",
            default = vim.fn.expand("<cword>")
          }, function(input)
            if input and input ~= "" then
              vim.cmd("JiraIssueView " .. input)
            end
          end)
        end, desc = "View Issue"
      },
      { "<leader>jc", "<cmd>JiraIssueCreate<cr>", desc = "Create Issue (Form)" },
      { "<leader>jt", function() 
          vim.ui.input({
            prompt = "Issue Key: ",
            default = vim.fn.expand("<cword>")
          }, function(issue_key)
            if issue_key and issue_key ~= "" then
              -- Get available transitions and show as options
              require('jira-nvim.cli').get_available_transitions(issue_key, function(err, states)
                if err then
                  -- Fallback to manual input if we can't get transitions
                  vim.ui.input({
                    prompt = "New State: ",
                  }, function(state)
                    if state and state ~= "" then
                      vim.cmd("JiraIssueTransition " .. issue_key .. " \"" .. state .. "\"")
                    end
                  end)
                else
                  -- Show available states as options
                  vim.ui.select(states, {
                    prompt = 'Select new state for ' .. issue_key .. ':',
                  }, function(choice)
                    if choice then
                      require('jira-nvim.cli').issue_transition(issue_key, choice)
                    end
                  end)
                end
              end)
            end
          end)
        end, desc = "Transition Issue"
      },
      
      -- Sprint management  
      { "<leader>js", "<cmd>JiraSprintList<cr>", desc = "List Sprints" },
      { "<leader>jS", "<cmd>JiraSprintList --current<cr>", desc = "Current Sprint" },
      
      -- Epic management
      { "<leader>je", "<cmd>JiraEpicList<cr>", desc = "List Epics" },
      
      -- Project/Board management
      { "<leader>jp", "<cmd>JiraProjectList<cr>", desc = "List Projects" },
      { "<leader>jb", "<cmd>JiraBoardList<cr>", desc = "List Boards" },
      
      -- Quick actions
      { "<leader>jo", function()
          local word = vim.fn.expand("<cword>")
          if word:match("^[A-Z]+-[0-9]+$") then
            vim.cmd("JiraOpen " .. word)
          else
            vim.cmd("JiraOpen")
          end
        end, desc = "Open in Browser"
      },
      
      -- Help
      { "<leader>j?", "<cmd>JiraHelp<cr>", desc = "Show Help" },
    },
    config = function(_, opts)
      require("jira-nvim").setup(opts)
    end,
  },
  
  -- Add which-key integration
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>j", group = "jira", icon = { icon = "󰌨 ", color = "blue" } },
      },
    },
  },
}
else
  return {}
end
