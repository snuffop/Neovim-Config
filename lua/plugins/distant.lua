-- distant
return {
  "chipsenkbeil/distant.nvim",
  branch = "v0.3",
  cmd = {
    "Distant",
    "DistantConnect",
    "DistantMetadata",
    "DistantRemove",
    "DistantShell",
    "DistantCopy",
    "DistantInstall",
    "DistantMkdir",
    "DistantRename",
    "DistantSpawn",
    "DistantRun",
    "DistantCAncelSearch",
    "DistantSystemInfo",
    "DistantSessionInfo",
    "DistantCheckHealth",
    "DistantClientVersion",
  },
  config = function()
    require("distant"):setup()
  end,
}
