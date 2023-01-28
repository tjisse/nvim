local set_keymap = vim.keymap.set

require('yanky').setup()

local default_opts = unpack({ silent = true, noremap = true })

set_keymap('n', 'p', '<Plug>(YankyPutAfter)', { default_opts })
set_keymap('n', 'P', '<Plug>(YankyPutBefore)', { default_opts })
set_keymap('x', 'p', '<Plug>(YankyPutAfter)', { default_opts })
set_keymap('x', 'P', '<Plug>(YankyPutBefore)', { default_opts })
set_keymap('n', 'gp', '<Plug>(YankyGPutAfter)', { default_opts })
set_keymap('n', 'gP', '<Plug>(YankyGPutBefore)', { default_opts })
set_keymap('x', 'gp', '<Plug>(YankyGPutAfter)', { default_opts })
set_keymap('x', 'gP', '<Plug>(YankyGPutBefore)', { default_opts })
set_keymap('n', '<c-n>', '<Plug>(YankyCycleForward)', { default_opts })
set_keymap('n', '<c-p>', '<Plug>(YankyCycleBackward)', { default_opts })

set_keymap('n', '<leader>p', require('telescope').extensions.yank_history.yank_history, { default_opts })
