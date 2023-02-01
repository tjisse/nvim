require('yanky').setup()

vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)', { silent = true })
vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)', { silent = true })
vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)', { silent = true })
vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)', { silent = true })
vim.keymap.set('n', '<C-n>', '<Plug>(YankyCycleForward)', { silent = true })
vim.keymap.set('n', '<C-p>', '<Plug>(YankyCycleBackward)', { silent = true })

vim.keymap.set('n', '<Space>y', require('telescope').extensions.yank_history.yank_history, { silent = true, desc = 'yank history' })
