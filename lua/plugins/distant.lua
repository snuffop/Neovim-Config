-- distant
return {
  "chipsenkbeil/distant.nvim",
  cmd = "Distant",
  branch = "v0.3",
  config = function()
    require("distant"):setup()
  end,
}
