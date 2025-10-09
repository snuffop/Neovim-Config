--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯


return {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
        bullet = {
            -- add space AFTER the bullet glyph
            right_pad = 1,     -- try 2 if you want more room
            -- optional: space BEFORE bullet if your indent looks tight
            -- left_pad = 1,
        },
        checkbox = {
            right_pad = 1,     -- keeps task boxes from hugging text
        },
    }
}

