-- ************************************************************************** --
--                                                                            --
--                                                        :::      ::::::::   --
--   init.lua                                           :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: Mbuchaus (Snuffop) <marty@dabuke.com>      +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2024/05/14 11:15:14 by Mbuchaus (Snu     #+#    #+#             --
--   Updated: 2024/05/14 11:15:33 by Mbuchaus (Snu    ###   ########.fr       --
--                                                                            --
-- ************************************************************************** --
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
