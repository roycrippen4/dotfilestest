local map = vim.keymap.set
local utils = require('core.utils')
utils.create_harpoon_nav_mappings()

-- stylua: ignore start
map('n', ';',                ':',                                      { desc = 'enter commandline'                 })
map('n', 'F',                utils.set_cur_file_first_mark,            { desc = 'Set current file as first mark'    })
map('n', 'L',                require('local.tabufline').tabuflineNext, { desc = 'Go to next tabufline buffer'       })
map('n', 'H',                require('local.tabufline').tabuflinePrev, { desc = 'Go to prev tabufline buffer'       })
map('n', 'dd',               utils.send_to_black_hole,                 { desc = 'smart delete'                      })
map('n', 'yil',              '^y$',                                    { desc = 'yank in line'                      })
map('n', '<C-n>',            '<cmd> NvimTreeToggle <CR>',              { desc = 'Open NvimTree'                     })
map('n', '<C-h>',            '<C-w><C-h>',                             { desc = 'Move focus to the left window'     })
map('n', '<C-l>',            '<C-w><C-l>',                             { desc = 'Move focus to the right window'    })
map('n', '<C-j>',            '<C-w><C-j>',                             { desc = 'Move focus to the lower window'    })
map('n', '<C-k>',            '<C-w><C-k>',                             { desc = 'Move focus to the upper window'    })
map('n', '<C-h>',            '<C-w>h',                                 { desc = 'Window left'                       })
map('n', '<C-l>',            '<C-w>l',                                 { desc = 'Window right'                      })
map('n', '<C-j>',            '<C-w>j',                                 { desc = 'Window down'                       })
map('n', '<C-k>',            '<C-w>k',                                 { desc = 'Window up'                         })
map('n', '<C-s>',            '<cmd> w <CR>',                           { desc = 'Save file'                         })
map('n', '<C-c>',            '<cmd> %y+ <CR>',                         { desc = 'Copy whole file'                   })
map('n', '<C-f>',            utils.harpoon_add_file,                   { desc = 'Mark file'                         })
map('n', '<C-e>',            utils.show_harpoon_menu,                  { desc = 'Harpoon menu'                      })
map('n', '<C-S-Y>',          'mZv_y`Z',                                { desc = 'Yank from cursor to start of line' })
map('n', '<M-S-.>',          '<C-w>>',                                 { desc = 'Increase window width'             })
map('n', '<M-S-,>',          '<C-w><',                                 { desc = 'Decrease window width'             })
map('n', '<M-j>',            ':m .+1<CR>==',                           { desc = 'Shift line down'                   })
map('n', '<M-k>',            ':m .-2<CR>==',                           { desc = 'Shift line up'                     })
map('n', '<leader>i',        '<cmd> Inspect <CR>',                           { desc = '  Inspect word under cursor'      })
map('n', '<leader>it',       '<cmd> InspectTree <CR>',                       { desc = '  Show AST'                       })
map('n', '<leader>q',        '<cmd> EditQuery <CR>',                         { desc = '󱄶  Edit TS query'                  })
map('n', '<leader>lf',       vim.diagnostic.open_float,                { desc = '  Show errors in float'           })
map('n', '<leader>M',        '<cmd> Mason <CR>',                       { desc = '  Show Mason'                     })
map('n', '<leader>lr',       '<cmd> luafile% <CR>',                    { desc = '  Run lua file'                   })
map('n', '<Leader>v',        '<C-w>v',                                 { desc = '  Vertical Split'                 })
map('n', '<Leader>h',        '<C-w>s',                                 { desc = '  Horizontal Split'               })
map('n', '<Leader>x',        utils.close_buf,                          { desc = '  Close Buffer'                   })
map('n', '<Leader><Leader>', '<cmd> Lazy <CR>',                        { desc = '  Open Lazy'                      })
-- stylua: ignore end

map('i', '<C-h>', '<Left>')
map('i', '<C-l>', '<Right>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-s>', '<cmd> w<CR>', { desc = 'Save file' })
map('v', '<M-j>', ":m '>+1<CR>gv=gv", { desc = 'Shift selection up', nowait = true, silent = true })
map('v', '<M-k>', ":m '<-2<CR>gv=gv", { desc = 'Shift selection down', nowait = true, silent = true })
map('i', '<M-j>', '<ESC>:m .+1<CR>==gi', { desc = 'Shift line up', nowait = true, silent = true })
map('i', '<M-k>', '<ESC>:m .-2<CR>==gi', { desc = 'Shift line up', nowait = true, silent = true })
map('i', 'jk', '<Esc>')
map('v', '<', '<gv', { desc = 'Un-Indent line' })
map('v', '>', '>gv', { desc = 'Indent line' })
map({ 'n', 'x' }, 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = 'Move down', expr = true })
map({ 'n', 'x' }, 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = 'Move up', expr = true })
map('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = 'Dont copy replaced text', silent = true })

-- Terminal
map('t', '<Esc>', require('core.utils').handle_lazygit_close, { desc = 'NTerminal mode' })
map('t', '<C-h>', [[<cmd> wincmd h<CR>]], { desc = 'Move focus left' })
map('t', '<C-j>', [[<cmd> wincmd j<CR>]], { desc = 'Move focus down' })
map('t', '<C-k>', [[<cmd> wincmd k<CR>]], { desc = 'Move focus up' })
map('t', '<C-l>', [[<cmd> wincmd l<CR>]], { desc = 'Move focus right' })
map({ 'n', 't' }, '<A-v>', require('local.term').toggle_vertical, { desc = 'New vertical term' })
map({ 'n', 't' }, '<A-h>', require('local.term').toggle_horizontal, { desc = 'New horizontal term' })
map({ 'n', 't' }, '<A-f>', require('local.term').toggle_floating, { desc = 'Toggleable Floating term' })

-- Command line
map('c', '(', '()<Left>', { desc = 'Insert parenthesis' })
map('c', '{', '{}<Left>', { desc = 'Insert curly braces' })
map('c', '[', '[]<Left>', { desc = 'Insert square brackets' })
map('c', "'", "''<Left>", { desc = 'Insert single quotes' })
map('c', '"', '""<Left>', { desc = 'Insert double quotes' })
map('c', '`', '``<Left>', { desc = 'Insert backticks' })
map('c', '<Esc>', '<C-c>', { desc = 'Exit command mode' })

-- package-info.nvim
map('n', '<leader>pu', function()
  require('package-info').update()
end, { desc = '󰚰  Update Package' })

-- stylua: ignore start
map('n', '<leader>td', function() require('trouble').toggle('workspace_diagnostics') end, { desc = '  Trouble toggle workspace diagnostics' })
-- stylua: ignore end
