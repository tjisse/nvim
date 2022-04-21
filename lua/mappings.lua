local map = vim.api.nvim_set_keymap
local wk = require('which-key')

local default_opts = { silent = true, noremap = true }

map('i', '<C-h>', '<C-w>h', default_opts)
map('i', '<C-j>', '<C-w>j', default_opts)
map('i', '<C-k>', '<C-w>k', default_opts)
map('i', '<C-l>', '<C-w>l', default_opts)

map('v', '<S-l>', '$', default_opts)
map('v', '<S-h>', '^', default_opts)

-- Move line / block of text in visual mode
-- alt + k to move up
-- alt + j to move down
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
    b = { ':Clap buffers<CR>', 'open buffers', unpack(default_opts) },
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
    d = { ':Clap files %:p:h<CR>', 'files in current directory', unpack(default_opts) },
    f = { ':Clap filer %:p:h<CR>', 'filer in current directory', unpack(default_opts) },
    h = { ':Clap files --hidden ~<CR>' , 'files in home directory' },
    s = 'save file',
    r = {  ':Clap history<CR>', 'recent files', unpack(default_opts) },
  },
  h = {
    name = '+git hunk',
    p = 'preview hunk',
    s = 'stage hunk',
    u = 'undo hunk',
  },
  M = { ':MerginalToggle<CR>', 'merginal', unpack(default_opts) },
  p = {
    name = '+project',
    a = { ':FSHere<CR>', 'switch to test/implementation', unpack(default_opts) },
    f = { ':Clap files --hidden .<CR>', 'find file in project', unpack(default_opts) },
    s = { ':Clap grep2 .<CR>', 'search in project', unpack(default_opts) }
  },
  U = { ':MundoToggle<CR>', 'undo tree', unpack(default_opts) },
  q = { ':quitall<CR>', 'quit', unpack(default_opts) },
  Q = { ':quitall!<CR>', 'quit without saving', unpack(default_opts) },
  r = {
    name = '+run',
    t = { ':UltestNearest<CR>', 'run nearest test' },
    T = { ':Ultest<CR>', 'run all tests in file' },
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
    ['?'] = ':Clap windows',
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
    v = 'split window below',
  }
}, { prefix = '<leader>'})