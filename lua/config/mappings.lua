local opts = unpack({ silent = true, noremap = true })

vim.keymap.set('n', '<leader>fs', '<Cmd>w<CR>', { opts, desc = 'save file' })

-- Jump to start/end line
vim.keymap.set('n', 'L', '$', { opts })
vim.keymap.set('n', 'H', '^', { opts })
vim.keymap.set('x', 'L', '$', { opts })
vim.keymap.set('x', 'H', '^', { opts })

-- Insert newline in normal mode
vim.keymap.set('n', '<S-CR>', 'O<Esc>', { opts })
vim.keymap.set('n', '<CR>', 'o<Esc>', { opts })
vim.api.nvim_create_autocmd('FileType', { pattern = { 'qf' }, command = 'nnoremap <buffer> <CR> <CR>' })
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'qf' },
    callback = function()
        vim.keymap.set('n', 'q', '<Cmd>cclose<CR>', { opts, buffer = true })
    end,
})

-- Better nav for omnicomplete
vim.keymap.set('i', '<expr>', '<C-j> ("<C-n>")', { opts })
vim.keymap.set('i', '<expr>', '<C-k> ("<C-p>")', { opts })

-- Visual shifting (does not exit Visual mode)
vim.keymap.set('x', '<', '<gv', { opts })
vim.keymap.set('x', '>', '>gv', { opts })

-- Buffer management
vim.keymap.set('n', '<leader>bd', '<Cmd>BD<CR>', { opts, desc = 'delete buffer' })
vim.keymap.set('n', '<leader>bk', '<Cmd>BD!<CR>', { opts, desc = 'kill buffer' })

-- Window management
vim.keymap.set('n', '<C-h>', '<C-w>h', { opts })
vim.keymap.set('n', '<C-j>', '<C-w>j', { opts })
vim.keymap.set('n', '<C-k>', '<C-w>k', { opts })
vim.keymap.set('n', '<C-l>', '<C-w>l', { opts })
vim.keymap.set('n', '<leader>w-', '<C-w>s<C-w>w', { opts, desc = 'split window below' })
vim.keymap.set('n', '<leader>w|', '<C-w>v<C-w>w', { opts, desc = 'split window right' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { opts, desc = 'balance window' })
vim.keymap.set('n', '<leader>ww', '<C-w>w', { opts, desc = 'other window' })
vim.keymap.set('n', '<leader>wd', '<C-w>c', { opts, desc = 'delete window' })
vim.keymap.set('n', '<leader>wH', '<Cmd>vertical resize -2<CR>', { opts, desc = 'expand window left' })
vim.keymap.set('n', '<leader>wL', '<Cmd>vertical resize +2<CR>', { opts, desc = 'expand window right' })
vim.keymap.set('n', '<leader>wJ', '<Cmd>resize +2<CR>', { opts, desc = 'expand window below' })
vim.keymap.set('n', '<leader>wK', '<Cmd>resize -2<CR>', { opts, desc = 'expand window up' })
vim.keymap.set('n', '<leader>ws', '<C-w>s<C-w>w', { opts, desc = 'split window below' })
vim.keymap.set('n', '<leader>wv', '<C-w>v<C-w>w', { opts, desc = 'split window right' })

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
vim.keymap.set('n', '<leader>td', '<Cmd>tabclose<CR>', { opts, desc = 'delete tab' })
vim.keymap.set('n', '<leader>tt', '<Cmd>$tabnew<CR>', { opts, desc = 'new tab' })

for i = 1, 9, 1 do
  vim.keymap.set('n', '<leader>' .. i, '<Cmd>' .. i .. 'tabnext<CR>', { opts, desc = 'tab ' .. i })
  vim.keymap.set('n', '<leader>t' .. i, '<Cmd>' .. i - 1 .. 'tabmove<CR>', { opts, desc = 'move tab to ' .. i })
end

vim.keymap.set('n', '<leader>sc', '<Cmd>nohlsearch<CR>', { opts, desc = 'clear search highlight' })

vim.keymap.set('n', '<leader>\'', '<Cmd>terminal<CR>', { opts })

vim.keymap.set('n', '<leader>q', '<Cmd>quitall<CR>', { opts, desc = 'quit' })
vim.keymap.set('n', '<leader>Q', '<Cmd>quitall!<CR>', { opts, desc = 'quit without saving' })
vim.keymap.set('n', '<leader>U', '<Cmd>MundoToggle<CR>', { opts, desc = 'undo tree' })
vim.keymap.set('n', '<leader>gg', '<Cmd>Neogit kind=floating<CR>', { opts, desc = 'Neogit' })
vim.keymap.set('n', '<leader>gb', '<Cmd>Gitsigns blame<CR>', { opts, desc = 'blame' })

-- Clear buffer-local mappings for [[ and ]]
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.keymap.del({ 'n', 'x', 'o' }, '[[', { buffer = true })
    vim.keymap.del({ 'n', 'x', 'o' }, ']]', { buffer = true })
  end,
})
