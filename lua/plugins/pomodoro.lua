-- Pomodoro timer
-- https://github.com/epwalsh/pomo.nvim

return {
  "epwalsh/pomo.nvim",
  version = "*", -- Recommended, use latest release instead of latest commit
  cmd = {
    "TimerStart",
    "TimerRepeat",
    "TimerSession",
  },
  dependencies = {
    "rcarriga/nvim-notify",
  },
  opts = {
    update_interval = 1000,
    notifiers = {
      {
        name = "Default",
        opts = {
          sticky = true,
          title_icon = "󱎫",
          text_icon = "󰄉",
        },
      },

      { name = "System" },
    },

    timers = {
      Break = {
        { name = "System" },
      },
    },
    sessions = {
      pomodoro = {
        { name = "Work", duration = "45m" },
        { name = "Short Break", duration = "5m" },
        { name = "Work", duration = "45m" },
        { name = "Short Break", duration = "5m" },
        { name = "Work", duration = "45m" },
        { name = "Long Break", duration = "15m" },
      },
    },
  },
}
