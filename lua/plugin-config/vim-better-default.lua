local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

local default_opts = { silent = true, noremap = true }

vim.g.vim_better_default_persistent_undo = 1
vim.g.vim_better_default_buffer_key_mapping = 0

vim.cmd[[runtime! plugin/default.vim]]

vim.opt.listchars:append({eol = ' '})
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'
vim.opt.showmode = false
vim.opt.wrap = true
vim.opt.breakindent = true

map('n', 'j', 'j', default_opts)
map('n', 'k', 'k', default_opts)
map('v', 'j', 'j', default_opts)
map('v', 'k', 'k', default_opts)

-- Insert newline in normal mode
map('n', '<S-CR>', 'O<Esc>', default_opts)
map('n', '<CR>', 'o<Esc>', default_opts)

-- Better nav for omnicomplete
map('i', '<expr>', '<c-j> ("<C-n>")', default_opts)
map('i', '<expr>', '<c-k> ("<C-p>")', default_opts)

unmap('i', 'jj')
unmap('c', 'jj')
