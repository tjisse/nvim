local map = vim.api.nvim_set_keymap
local wk = require('which-key')

local default_opts = { silent = true, noremap = true }

map('v', '<S-l>', '$', default_opts)
map('v', '<S-h>', '^', default_opts)

-- Move line / block of text in visual mode
map('n', '<C-S-j>', ':move .+1<CR>==', default_opts)
map('n', '<C-S-k>', ':move .-2<CR>==', default_opts)
map('x', '<C-S-j>', ':move \'<-2<CR>gv-gv', default_opts)
map('x', '<C-S-k>', ':move \'>+1<CR>gv-gv', default_opts)

-- Better window navigation
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- Terminal window navigation
map('t', '<C-h>', '<C-\\><C-N><C-w>h', default_opts)
map('t', '<C-j>', '<C-\\><C-N><C-w>j', default_opts)
map('t', '<C-k>', '<C-\\><C-N><C-w>k', default_opts)
map('t', '<C-l>', '<C-\\><C-N><C-w>l', default_opts)
map('i', '<C-h>', '<C-\\><C-N><C-w>h', default_opts)
map('i', '<C-j>', '<C-\\><C-N><C-w>j', default_opts)
map('i', '<C-k>', '<C-\\><C-N><C-w>k', default_opts)
map('i', '<C-l>', '<C-\\><C-N><C-w>l', default_opts)
map('t', '<Esc>', '<C-\\><C-n>', default_opts)

map('n', '<C-Up>', '   :resize -2<CR>', default_opts)
map('n', '<C-Down>', ' :resize +2<CR>', default_opts)
map('n', '<C-Left>', ' :vertical resize -2<CR>', default_opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', default_opts)

map('n', 'f', '<Plug>Lightspeed_s', default_opts)
map('n', 'F', '<Plug>Lightspeed_S', default_opts)

map('n', '-', ':lua require(\'telescope\').extensions.file_browser.file_browser({ cwd = vim.fn.expand(\'%:p:h\') })<CR>', default_opts)

wk.register({
  ['1'] = { ':1tabnext<CR>', 'tab 1', unpack(default_opts) },
  ['2'] = { ':2tabnext<CR>', 'tab 2', unpack(default_opts) },
  ['3'] = { ':3tabnext<CR>', 'tab 3', unpack(default_opts) },
  ['4'] = { ':4tabnext<CR>', 'tab 4', unpack(default_opts) },
  ['5'] = { ':5tabnext<CR>', 'tab 5', unpack(default_opts) },
  ['6'] = { ':6tabnext<CR>', 'tab 6', unpack(default_opts) },
  ['7'] = { ':7tabnext<CR>', 'tab 7', unpack(default_opts) },
  ['8'] = { ':8tabnext<CR>', 'tab 8', unpack(default_opts) },
  ['9'] = { ':9tabnext<CR>', 'tab 9', unpack(default_opts) },
  ['<Tab>'] = { ':b#<CR>', 'previous buffer', unpack(default_opts) },
  b = {
    name = '+buffer',
    d = { ':BD<CR>', 'delete buffer', unpack(default_opts) },
    k = { ':BD!<CR>', 'kill buffer', unpack(default_opts) },
    f = { ':bfirst<CR>', 'first buffer', unpack(default_opts) },
    l = { ':blast<CR>', 'last buffer', unpack(default_opts) },
    n = { ':bnext<CR>', 'next buffer', unpack(default_opts) },
    N = { ':bprevious<CR>', 'previous buffer', unpack(default_opts) },
    b = { ':lua require(\'telescope.builtin\').buffers()<CR>', 'open buffers', unpack(default_opts) },
  },
  f = {
    name = '+files/fold',
    ['0'] = '0 fold level',
    ['1'] = '1 fold level',
    ['2'] = '2 fold level',
    ['3'] = '3 fold level',
    ['4'] = '4 fold level',
    ['5'] = '5 fold level',
    ['6'] = '6 fold level',
    ['7'] = '7 fold level',
    ['8'] = '8 fold level',
    ['9'] = '9 fold level',
    d = { ':lua require(\'telescope.builtin\').find_files({ cwd = vim.fn.expand(\'%:p:h\') })<CR>', 'files in current directory', unpack(default_opts) },
    f = { ':lua require(\'telescope\').extensions.file_browser.file_browser({ cwd = vim.fn.expand(\'%:p:h\') })<CR>', 'file browser in current directory', unpack(default_opts) },
    h = { ':lua require(\'telescope.builtin\').find_files({ cwd = \'~\', hidden = true })<CR>' , 'files in home directory' },
    p = { ':lua require(\'telescope.builtin\').find_files({ cwd = \'D:/work/Projects\', hidden = true })<CR>' , 'files in project folder' },
    s = 'save file',
    r = {  ':Telescope oldfiles<CR>', 'recent files', unpack(default_opts) },
  },
  h = {
    name = '+git hunk',
    p = { ':Gitsigns preview_hunk<CR>', 'preview hunk', unpack(default_opts) },
    s = { ':Gitsigns stage_hunk<CR>', 'stage hunk', unpack(default_opts) },
    u = { ':Gitsigns undo_stage_hunk<CR>', 'undo stage hunk', unpack(default_opts) },
    r = { ':Gitsigns reset_hunk<CR>', 'reset hunk', unpack(default_opts) },
  },
  M = { ':MerginalToggle<CR>', 'merginal', unpack(default_opts) },
  p = {
    name = '+project',
    a = { ':FSHere<CR>', 'switch to test/implementation', unpack(default_opts) },
    f = { ':lua require(\'telescope.builtin\').find_files()<CR>', 'find file in project', unpack(default_opts) },
    p = { ':lua require(\'telescope\').extensions.projects.projects()<CR>', 'find project', unpack(default_opts) },
    s = { ':lua require(\'telescope.builtin\').live_grep()<CR>', 'search in project', unpack(default_opts) }
  },
  U = { ':MundoToggle<CR>', 'undo tree', unpack(default_opts) },
  q = { ':quitall<CR>', 'quit', unpack(default_opts) },
  Q = { ':quitall!<CR>', 'quit without saving', unpack(default_opts) },
  r = {
    name = '+run',
    t = { ':lua require("neotest").run.run()<CR>', 'run nearest test' },
    T = { ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', 'run all tests in file' },
  },
  s = {
    name = '+search',
    b = 'search in buffer',
    c = 'clear search highlight',
  },
  t = {
    name = '+tab/toggle',
    d = { ':tabclose<CR>', 'delete tab', unpack(default_opts) },
    t = { ':tabnew<CR>', 'new tab', unpack(default_opts) },
    p = 'set paste',
  },
  w = {
    name = '+windows',
    ['-'] = 'split window below',
    ['|'] = 'split window right',
    ['2'] = 'layout double columns',
    ['='] = 'balance window',
    f = { ':lua require(\'telescope\').extensions.windows.list()<CR>', 'find window' },
    w = 'other window',
    d = 'delete window',
    h = 'window left',
    j = 'window below',
    l = 'window right',
    k = 'window up',
    H = 'expand window left',
    J = 'expand window below',
    L = 'expand window right',
    K = 'expand window up',
    s = 'split window below',
    v = 'split window right',
  }
}, { prefix = '<leader>'})
