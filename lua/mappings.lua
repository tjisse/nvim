local set_keymap = vim.keymap.set

local default_opts = unpack({ silent = true, noremap = true })

local projects_path
if vim.fn.has('win32') then
  projects_path = 'D:/work/Projects'
else
  projects_path = '~/Projects'
end

set_keymap('n', '<Leader>fs', ':w<CR>', { default_opts, desc = 'save file' })

-- Jump to start/end line
set_keymap('n', 'L', '$', { default_opts })
set_keymap('n', 'H', '^', { default_opts })
set_keymap('v', 'L', '$', { default_opts })
set_keymap('v', 'H', '^', { default_opts })

-- Insert newline in normal mode
set_keymap('n', '<S-CR>', 'O<Esc>', { default_opts })
set_keymap('n', '<CR>', 'o<Esc>', { default_opts })
vim.api.nvim_create_autocmd('BufReadPost', { pattern = 'quickfix', command = 'nnoremap <buffer> <CR> <CR>' })

-- Better nav for omnicomplete
set_keymap('i', '<expr>', '<c-j> ("<C-n>")', { default_opts })
set_keymap('i', '<expr>', '<c-k> ("<C-p>")', { default_opts })

-- Move line / block of text in visual mode
set_keymap('n', '<C-S-j>', ':move .+1<CR>==', { default_opts })
set_keymap('n', '<C-S-k>', ':move .-2<CR>==', { default_opts })
set_keymap('x', '<C-S-j>', ':move \'<-2<CR>gv-gv', { default_opts })
set_keymap('x', '<C-S-k>', ':move \'>+1<CR>gv-gv', { default_opts })

-- Visual shifting (does not exit Visual mode)
set_keymap('v', '<', '<gv', { default_opts })
set_keymap('v', '>', '>gv', { default_opts })

-- Buffer management
set_keymap('n', '<Leader>bd', ':BD<CR>', { default_opts, desc = 'delete buffer' })
set_keymap('n', '<Leader>bk', ':BD!<CR>', { default_opts, desc = 'kill buffer' })
set_keymap('n', '<Leader>bf', ':bfirst<CR>', { default_opts, desc = 'first buffer' })
set_keymap('n', '<Leader>bl', ':blast<CR>', { default_opts, desc = 'last buffer' })
set_keymap('n', '<Leader>bn', ':bnext<CR>', { default_opts, desc = 'next buffer' })
set_keymap('n', '<Leader>bN', ':bprevious<CR>', { default_opts, desc = 'previous buffer' })

-- Window management
set_keymap('n', '<C-h>', '<C-w>h', { default_opts })
set_keymap('n', '<C-j>', '<C-w>j', { default_opts })
set_keymap('n', '<C-k>', '<C-w>k', { default_opts })
set_keymap('n', '<C-l>', '<C-w>l', { default_opts })
set_keymap('n', '<Leader>w-', '<C-W>s', { default_opts, desc = 'split window below' })
set_keymap('n', '<Leader>w|', '<C-W>v', { default_opts, desc = 'split window right' })
set_keymap('n', '<Leader>w=', '<C-W>=', { default_opts, desc = 'balance window' })
set_keymap('n', '<Leader>wf', require('telescope').extensions.windows.list, { default_opts, desc = 'find window' })
set_keymap('n', '<Leader>ww', '<C-W>w', { default_opts, desc = 'other window' })
set_keymap('n', '<Leader>wd', '<C-W>c', { default_opts, desc = 'delete window' })
set_keymap('n', '<Leader>wH', ':vertical resize -2<CR>', { default_opts, desc = 'expand window left' })
set_keymap('n', '<Leader>wL', ':vertical resize +2<CR>', { default_opts, desc = 'expand window right' })
set_keymap('n', '<Leader>wJ', ':resize +2<CR>', { default_opts, desc = 'expand window below' })
set_keymap('n', '<Leader>wK', ':resize -2<CR>', { default_opts, desc = 'expand window up' })
set_keymap('n', '<Leader>ws', '<C-W>s', { default_opts, desc = 'split window below' })
set_keymap('n', '<Leader>wv', '<C-W>v', { default_opts, desc = 'split window right' })

-- Terminal window management
set_keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', { default_opts })
set_keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', { default_opts })
set_keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', { default_opts })
set_keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', { default_opts })
set_keymap('i', '<C-h>', '<C-\\><C-N><C-w>h', { default_opts })
set_keymap('i', '<C-j>', '<C-\\><C-N><C-w>j', { default_opts })
set_keymap('i', '<C-k>', '<C-\\><C-N><C-w>k', { default_opts })
set_keymap('i', '<C-l>', '<C-\\><C-N><C-w>l', { default_opts })
set_keymap('t', '<Esc>', '<C-\\><C-n>', { default_opts })

-- Tab management
set_keymap('n', '<Leader>td', ':tabclose<CR>', { default_opts, desc = 'delete tab' })
set_keymap('n', '<Leader>tt', ':tabnew<CR>', { default_opts, desc = 'new tab' })

set_keymap('n', 'f', '<Plug>(leap-forward-to)', { default_opts })
set_keymap('n', 'F', '<Plug>(leap-backward-to)', { default_opts })

set_keymap('n', '<Leader>sc', ':nohlsearch<CR>', { default_opts, desc = 'clear search highlight' })

set_keymap('n', '<Leader>\'', ':terminal<CR>', { default_opts })

set_keymap('n', '<Leader>q', ':quitall<CR>', { default_opts, desc = 'quit' })
set_keymap('n', '<Leader>Q', ':quitall!<CR>', { default_opts, desc = 'quit without saving' })
set_keymap('n', '<Leader>U', ':MundoToggle<CR>', { default_opts, desc = 'undo tree' })

-- Git signs hunk
set_keymap('n', '<Leader>hp', ':Gitsigns preview_hunk<CR>', { default_opts, desc = 'preview hunk' })
set_keymap('n', '<Leader>hs', ':Gitsigns stage_hunk<CR>', { default_opts, desc = 'stage hunk' })
set_keymap('n', '<Leader>hu', ':Gitsigns undo_stage_hunk<CR>', { default_opts, desc = 'undo stage hunk' })
set_keymap('n', '<Leader>hr', ':Gitsigns reset_hunk<CR>', { default_opts, desc = 'reset hunk' })

set_keymap('n', '-', require('oil').open_float, { desc = 'go to parent directory' })
set_keymap('n', '<Leader>fd', function() require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') }) end, { default_opts, desc = 'files in current directory' })
set_keymap('n', '<Leader>fr', ':Telescope oldfiles<CR>', { default_opts, desc = 'recent files' })
set_keymap('n', '<Leader>bb', require('telescope.builtin').buffers, { default_opts, desc = 'open buffers' })
set_keymap('n', '<Leader>ff', require('oil').open, { desc = 'open parent directory' })
set_keymap('n', '<Leader>fh', function() require('telescope.builtin').find_files({ cwd = '~', hidden = true }) end, { default_opts, desc = 'files in home directory' })
set_keymap('n', '<Leader>fp', function() require('telescope.builtin').find_files({ cwd = projects_path, hidden = true }) end, { default_opts, desc = 'files in project folder' })
set_keymap('n', '<Leader>gc', require('telescope.builtin').git_bcommits, { default_opts, desc = 'commits for current buffer' })
set_keymap('n', '<Leader>pf', require('telescope.builtin').find_files, { default_opts, desc = 'find file in project' })
set_keymap('n', '<Leader>pp', require('telescope').extensions.projects.projects, { default_opts, desc = 'find project' })
set_keymap('n', '<Leader>ps', require('telescope.builtin').live_grep, { default_opts, desc = 'search in project' })
