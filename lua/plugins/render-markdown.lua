--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- github.com 

return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 
        'nvim-treesitter/nvim-treesitter', 
        'nvim-tree/nvim-web-devicons' 
    },
    ft = { 'markdown' },
    cmd = {
        "RenderMarkdown",
    },
    opts = {
        render_modes = { 'n', 'v', 'i', 'c' },
        injections = {
            gitcommit = {
                enabled = true,
                query = [[
                ((message) @injection.content
                    (#set! injection.combined)
                    (#set! injection.include-children)
                    (#set! injection.language "markdown"))
            ]],
            },
        },
        heading = {
            -- Turn on / off heading icon & background rendering
            enabled = true,
            -- Turn on / off any sign column related rendering
            sign = true,
            -- Determines how icons fill the available space:
            --  inline:  underlying '#'s are concealed resulting in a left aligned icon
            --  overlay: result is left padded with spaces to hide any additional '#'
            position = 'overlay',
            -- Replaces '#+' of 'atx_h._marker'
            -- The number of '#' in the heading determines the 'level'
            -- The 'level' is used to index into the array using a cycle
            icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
            -- Added to the sign column if enabled
            -- The 'level' is used to index into the array using a cycle
            signs = { '󰫎 ' },
            -- Width of the heading background:
            --  block: width of the heading text
            --  full:  full width of the window
            -- Can also be an array of the above values in which case the 'level' is used
            -- to index into the array using a clamp
            width = 'full',
            -- Amount of padding to add to the left of headings
            left_pad = 0,
            -- Amount of padding to add to the right of headings when width is 'block'
            right_pad = 0,
            -- Minimum width to use for headings when width is 'block'
            min_width = 0,
            -- Determins if a border is added above and below headings
            border = false,
            -- Highlight the start of the border using the foreground highlight
            border_prefix = false,
            -- Used above heading for border
            above = '▄',
            -- Used below heading for border
            below = '▀',
            -- The 'level' is used to index into the array using a clamp
            -- Highlight for the heading icon and extends through the entire line
            backgrounds = {
                'RenderMarkdownH1Bg',
                'RenderMarkdownH2Bg',
                'RenderMarkdownH3Bg',
                'RenderMarkdownH4Bg',
                'RenderMarkdownH5Bg',
                'RenderMarkdownH6Bg',
            },
            -- The 'level' is used to index into the array using a clamp
            -- Highlight for the heading and sign icons
            foregrounds = {
                'RenderMarkdownH1',
                'RenderMarkdownH2',
                'RenderMarkdownH3',
                'RenderMarkdownH4',
                'RenderMarkdownH5',
                'RenderMarkdownH6',
            },
        },

        indent = {
            -- Turn on / off org-indent-mode
            enabled = true,
            -- Amount of additional padding added for each heading level
            per_level = 2,
            -- Heading levels <= this value will not be indented
            -- Use 0 to begin indenting from the very first level
            skip_level = 1,
            -- Do not indent heading titles, only the body
            skip_heading = true,
        },

        callout = {
            note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
            tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
            important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
            warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
            caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
            -- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
            abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
            summary = { raw = '[!SUMMARY]', rendered = '󰨸 Summary', highlight = 'RenderMarkdownInfo' },
            tldr = { raw = '[!TLDR]', rendered = '󰨸 Tldr', highlight = 'RenderMarkdownInfo' },
            info = { raw = '[!INFO]', rendered = '󰋽 Info', highlight = 'RenderMarkdownInfo' },
            todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
            hint = { raw = '[!HINT]', rendered = '󰌶 Hint', highlight = 'RenderMarkdownSuccess' },
            success = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess' },
            check = { raw = '[!CHECK]', rendered = '󰄬 Check', highlight = 'RenderMarkdownSuccess' },
            done = { raw = '[!DONE]', rendered = '󰄬 Done', highlight = 'RenderMarkdownSuccess' },
            question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn' },
            help = { raw = '[!HELP]', rendered = '󰘥 Help', highlight = 'RenderMarkdownWarn' },
            faq = { raw = '[!FAQ]', rendered = '󰘥 Faq', highlight = 'RenderMarkdownWarn' },
            attention = { raw = '[!ATTENTION]', rendered = '󰀪 Attention', highlight = 'RenderMarkdownWarn' },
            failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError' },
            fail = { raw = '[!FAIL]', rendered = '󰅖 Fail', highlight = 'RenderMarkdownError' },
            missing = { raw = '[!MISSING]', rendered = '󰅖 Missing', highlight = 'RenderMarkdownError' },
            danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError' },
            error = { raw = '[!ERROR]', rendered = '󱐌 Error', highlight = 'RenderMarkdownError' },
            bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError' },
            example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint' },
            quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote' },
            cite = { raw = '[!CITE]', rendered = '󱆨 Cite', highlight = 'RenderMarkdownQuote' },
        },

        bullet = {
            -- Turn on / off list bullet rendering
            enabled = true,
            -- Replaces '-'|'+'|'*' of 'list_item'
            -- How deeply nested the list is determines the 'level'
            -- The 'level' is used to index into the array using a cycle
            -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
            icons = { '●', '○', '◆', '◇' },
            -- Padding to add to the left of bullet point
            left_pad = 0,
            -- Padding to add to the right of bullet point
            right_pad = 0,
            -- Highlight for the bullet icon
            highlight = 'RenderMarkdownBullet',
        },

        pipe_table = {
            -- Turn on / off pipe table rendering
            enabled = true,
            -- Pre configured settings largely for setting table border easier
            --  heavy:  use thicker border characters
            --  double: use double line border characters
            --  round:  use round border corners
            --  none:   does nothing
            preset = 'normal',
            -- Determines how the table as a whole is rendered:
            --  none:   disables all rendering
            --  normal: applies the 'cell' style rendering to each row of the table
            --  full:   normal + a top & bottom line that fill out the table when lengths match
            style = 'full',
            -- Determines how individual cells of a table are rendered:
            --  overlay: writes completely over the table, removing conceal behavior and highlights
            --  raw:     replaces only the '|' characters in each row, leaving the cells unmodified
            --  padded:  raw + cells are padded with inline extmarks to make up for any concealed text
            cell = 'padded',
            -- Minimum column width to use for padded cell
            min_width = 0,
            -- Characters used to replace table border
            -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal
            -- stylua: ignore
            border = {
                '┌', '┬', '┐',
                '├', '┼', '┤',
                '└', '┴', '┘',
                '│', '─',
            },
            -- Gets placed in delimiter row for each column, position is based on alignmnet
            alignment_indicator = '━',
            -- Highlight for table heading, delimiter, and the line above
            head = 'RenderMarkdownTableHead',
            -- Highlight for everything else, main table rows and the line below
            row = 'RenderMarkdownTableRow',
            -- Highlight for inline padding used to add back concealed space
            filler = 'RenderMarkdownTableFill',
        },

        checkbox = {
            -- Turn on / off checkbox state rendering
            enabled = true,
            -- Determines how icons fill the available space:
            --  inline:  underlying text is concealed resulting in a left aligned icon
            --  overlay: result is left padded with spaces to hide any additional text
            position = 'inline',
            unchecked = {
                -- Replaces '[ ]' of 'task_list_marker_unchecked'
                icon = '󰄱 ',
                -- Highlight for the unchecked icon
                highlight = 'RenderMarkdownUnchecked',
            },
            checked = {
                -- Replaces '[x]' of 'task_list_marker_checked'
                icon = '󰱒 ',
                -- Highligh for the checked icon
                highlight = 'RenderMarkdownChecked',
            },
            -- Define custom checkbox states, more involved as they are not part of the markdown grammar
            -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
            -- Can specify as many additional states as you like following the 'todo' pattern below
            --   The key in this case 'todo' is for healthcheck and to allow users to change its values
            --   'raw':       Matched against the raw text of a 'shortcut_link'
            --   'rendered':  Replaces the 'raw' value when rendering
            --   'highlight': Highlight for the 'rendered' icon
            custom = {
                todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
            },
        },

        dash = {
            -- Turn on / off thematic break rendering
            enabled = true,
            -- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
            -- The icon gets repeated across the window's width
            icon = '─',
            -- Width of the generated line:
            --  <integer>: a hard coded width value
            --  full:      full width of the window
            width = 'full',
            -- Highlight for the whole line generated from the icon
            highlight = 'RenderMarkdownDash',
        },
    },
}
