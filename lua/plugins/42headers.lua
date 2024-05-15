-- ************************************************************************** --
--                                                                            --
--                                                        :::      ::::::::   --
--   42headers.lua                                      :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: Mbuchaus (Snuffop) <marty@dabuke.com>      +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2024/05/14 11:14:42 by Mbuchaus (Snu     #+#    #+#             --
--   Updated: 2024/05/14 11:14:54 by Mbuchaus (Snu    ###   ########.fr       --
--                                                                            --
-- ************************************************************************** --

-- 42 headers rewrite in luas
-- https://github.com/Diogo-ss/42-header.nvim

return {
  "Diogo-ss/42-header.nvim",
  cmd = { "Stdheader" },
  keys = { "<F1>" },
  opts = {
    git = {
      ---Enable Git support.
      enabled = true,
      ---PATH to the Git binary.
      bin = "git",
      ---Use global user.name, otherwise use local user.name.
      user_global = true,
      ---Use global user.email, otherwise use local user.email.
      email_global = true,
    },
  },
  config = function(_, opts)
    require("42header").setup(opts)
  end,
}
