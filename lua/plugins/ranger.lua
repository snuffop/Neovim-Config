-- rnvimr  Ranger
return {
    'kevinhwang91/rnvimr',  -- Ranger
    cmd = {
        "Rnvimr",
        "RnvimrToggle",
    },
    init = function()
        vim.g.rnvimr_draw_border = 1
        vim.g.rnvimr_enable_picker = 1
        vim.g.rnvimr_bw_enable = 1
        vim.g.rnvimr_enable_ex = 1
        vim.g.rnvimr_enable_bw = 1
        vim.g.rnvimr_hide_gitignore = 1
    end,
}
