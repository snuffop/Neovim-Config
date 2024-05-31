--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Config                              │
--  ╰──────────────────────────────────────────────────────────╯

function get_hostname()
  local f = io.popen("/bin/hostname")
  local hostname = f:read("a") or ""
  f:close()
  hostname = string.gsub(hostname, "\n$", "")
  return hostname
end

require("config/general")
require("config/lazy")
