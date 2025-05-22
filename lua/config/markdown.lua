--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

local query = vim.treesitter.query.parse('markdown', '((atx_heading) @header (setext_heading) @header)')
local root = vim.treesitter.get_parser():parse():root()
local captures = query:iter_captures(root, 0, vim.fn.line('.'), vim.fn.line('$'))

local function get_sub_headers(node)
    local sub_headers = {}
    for _, sub_node in node:iter_children() do
        if sub_node:type() == 'atx_heading' or sub_node:type() == 'setext_heading' then
            table.insert(sub_headers, sub_node)
            table.insert(sub_headers, get_sub_headers(sub_node))
        end
    end
    return sub_headers
end

local function print_headers(headers)
    for _, header in ipairs(headers) do
        print(header:range())
    end
end

local current_header = nil
for _, node, _ in captures do
    if node:range():inlineRefs{references="&#91;&#123;&quot;type&quot;&#58;&quot;inline_reference&quot;,&quot;start_index&quot;&#58;1040,&quot;end_index&quot;&#58;1043,&quot;number&quot;&#58;1,&quot;url&quot;&#58;&quot;https&#58;//www.reddit.com/r/neovim/comments/192s9j9/markdown_header_jump/&quot;,&quot;favicon&quot;&#58;&quot;https&#58;//imgs.search.brave.com/U-eHNCapRHVNWWCVPPMTIvOofZULh0_A_FQKe8xTE4I/rs&#58;fit&#58;32&#58;32&#58;1&#58;0/g&#58;ce/aHR0cDovL2Zhdmlj/b25zLnNlYXJjaC5i/cmF2ZS5jb20vaWNv/bnMvN2ZiNTU0M2Nj/MTFhZjRiYWViZDlk/MjJiMjBjMzFjMDRk/Y2IzYWI0MGI0MjVk/OGY5NzQzOGQ5NzQ5/NWJhMWI0NC93d3cu/cmVkZGl0LmNvbS8&quot;,&quot;snippet&quot;&#58;&quot;Markdown&#32;header&#32;jump\n&#32;&#32;&#32;&#32;\n\n\n&#32;&#32;&#32;&#32;&#32;&#32;With&#32;a&#32;\&quot;little\&quot;&#32;help&#32;from&#32;neovim&#32;discourse&#32;group&#32;I&#32;have&#32;a&#32;function&#32;\&quot;mapped\&quot;&#32;to&#32;jump&#32;to&#32;the&#32;next&#32;markdown&#32;header\n&#32;&#32;&#32;&#32;\n\n&#32;&#32;&#32;&#32;&#32;&#32;https&#58;//neovim.discourse.group/t/how-can-i-create-a-keymap-using-treesitter-to-jump-to-the-next-markdown-header/4579/2\n&#32;&#32;&#32;&#32;\n\n&#32;&#32;&#32;&#32;&#32;&#32;here&#32;is&#32;the&#32;code&#58;\n&#32;&#32;&#32;&#32;\n\nlocal&#32;query=vim.treesitter.query.parse('markdown','((atx_heading)&#32;)')\nvim.keymap.set('n…&quot;&#125;&#93;"} >= vim.fn.line('.') then
        current_header = node
        break
    end
end

if current_header then
    local sub_headers = get_sub_headers(current_header)
    print_headers(sub_headers)
else
    print('No header found at current line')
end
