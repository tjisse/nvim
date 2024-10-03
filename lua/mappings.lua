local opts = unpack({ silent = true, noremap = true })

vim.keymap.set('n', '<leader>fs', ':w<CR>', { opts, desc = 'save file' })

-- Jump to start/end line
vim.keymap.set('n', 'L', '$', { opts })
vim.keymap.set('n', 'H', '^', { opts })
vim.keymap.set('x', 'L', '$', { opts })
vim.keymap.set('x', 'H', '^', { opts })

-- Insert newline in normal mode
vim.keymap.set('n', '<S-CR>', 'O<Esc>', { opts })
vim.keymap.set('n', '<CR>', 'o<Esc>', { opts })
vim.api.nvim_create_autocmd('BufReadPost', { pattern = 'quickfix', command = 'nnoremap <buffer> <CR> <CR>' })

-- Better nav for omnicomplete
vim.keymap.set('i', '<expr>', '<C-j> ("<C-n>")', { opts })
vim.keymap.set('i', '<expr>', '<C-k> ("<C-p>")', { opts })

-- Move line / block of text in visual mode
-- vim.keymap.set('n', '<C-S-j>', ':move .+1<CR>==', { opts })
-- vim.keymap.set('n', '<C-S-k>', ':move .-2<CR>==', { opts })
-- vim.keymap.set('x', '<C-S-j>', ':move \'>+1<CR>gv-gv', { opts })
-- vim.keymap.set('x', '<C-S-k>', ':move \'<-2<CR>gv-gv', { opts })

-- Visual shifting (does not exit Visual mode)
vim.keymap.set('x', '<', '<gv', { opts })
vim.keymap.set('x', '>', '>gv', { opts })

-- Buffer management
vim.keymap.set('n', '<leader>bd', ':BD<CR>', { opts, desc = 'delete buffer' })
vim.keymap.set('n', '<leader>bk', ':BD!<CR>', { opts, desc = 'kill buffer' })
vim.keymap.set('n', '<leader>bf', ':bfirst<CR>', { opts, desc = 'first buffer' })
vim.keymap.set('n', '<leader>bl', ':blast<CR>', { opts, desc = 'last buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { opts, desc = 'next buffer' })
vim.keymap.set('n', '<leader>bN', ':bprevious<CR>', { opts, desc = 'previous buffer' })

-- Window management
vim.keymap.set('n', '<C-h>', '<C-w>h', { opts })
vim.keymap.set('n', '<C-j>', '<C-w>j', { opts })
vim.keymap.set('n', '<C-k>', '<C-w>k', { opts })
vim.keymap.set('n', '<C-l>', '<C-w>l', { opts })
vim.keymap.set('n', '<leader>w-', '<C-W>s', { opts, desc = 'split window below' })
vim.keymap.set('n', '<leader>w|', '<C-W>v', { opts, desc = 'split window right' })
vim.keymap.set('n', '<leader>w=', '<C-W>=', { opts, desc = 'balance window' })
vim.keymap.set('n', '<leader>ww', '<C-W>w', { opts, desc = 'other window' })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { opts, desc = 'delete window' })
vim.keymap.set('n', '<leader>wH', ':vertical resize -2<CR>', { opts, desc = 'expand window left' })
vim.keymap.set('n', '<leader>wL', ':vertical resize +2<CR>', { opts, desc = 'expand window right' })
vim.keymap.set('n', '<leader>wJ', ':resize +2<CR>', { opts, desc = 'expand window below' })
vim.keymap.set('n', '<leader>wK', ':resize -2<CR>', { opts, desc = 'expand window up' })
vim.keymap.set('n', '<leader>ws', '<C-W>s', { opts, desc = 'split window below' })
vim.keymap.set('n', '<leader>wv', '<C-W>v', { opts, desc = 'split window right' })

-- Terminal window management
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h', { opts })
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j', { opts })
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k', { opts })
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l', { opts })
vim.keymap.set('i', '<C-h>', '<C-\\><C-N><C-w>h', { opts })
vim.keymap.set('i', '<C-j>', '<C-\\><C-N><C-w>j', { opts })
vim.keymap.set('i', '<C-k>', '<C-\\><C-N><C-w>k', { opts })
vim.keymap.set('i', '<C-l>', '<C-\\><C-N><C-w>l', { opts })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { opts })

-- Tab management
vim.keymap.set('n', '<leader>td', ':tabclose<CR>', { opts, desc = 'delete tab' })
vim.keymap.set('n', '<leader>tt', ':$tabnew<CR>', { opts, desc = 'new tab' })

for i = 1, 9, 1 do
  vim.keymap.set('n', '<leader>' .. i, ':' .. i .. 'tabnext<CR>', { opts, desc = 'tab ' .. i })
  vim.keymap.set('n', '<leader>t' .. i, ':' .. i - 1 .. 'tabmove<CR>', { opts, desc = 'move tab to ' .. i })
end

vim.keymap.set('n', '<leader>sc', ':nohlsearch<CR>', { opts, desc = 'clear search highlight' })

vim.keymap.set('n', '<leader>\'', ':terminal<CR>', { opts })

vim.keymap.set('n', '<leader>q', ':quitall<CR>', { opts, desc = 'quit' })
vim.keymap.set('n', '<leader>Q', ':quitall!<CR>', { opts, desc = 'quit without saving' })
vim.keymap.set('n', '<leader>U', ':MundoToggle<CR>', { opts, desc = 'undo tree' })
