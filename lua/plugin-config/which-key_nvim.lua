local wk = require('which-key')

wk.setup({
  key_labels = {
    ['<CR>'] = '↵',
    ['<Tab>'] = '⇆',
    ['<Space>'] = '⎵',
  }
})

wk.register({
  ['1'] = { ':1tabnext<CR>', 'tab 1', { silent = true } },
  ['2'] = { ':2tabnext<CR>', 'tab 2', { silent = true } },
  ['3'] = { ':3tabnext<CR>', 'tab 3', { silent = true } },
  ['4'] = { ':4tabnext<CR>', 'tab 4', { silent = true } },
  ['5'] = { ':5tabnext<CR>', 'tab 5', { silent = true } },
  ['6'] = { ':6tabnext<CR>', 'tab 6', { silent = true } },
  ['7'] = { ':7tabnext<CR>', 'tab 7', { silent = true } },
  ['8'] = { ':8tabnext<CR>', 'tab 8', { silent = true } },
  ['9'] = { ':9tabnext<CR>', 'tab 9', { silent = true } },
  ['<Tab>'] = { ':b#<CR>', 'previous buffer', { silent = true } },
  b = { name = 'buffer' },
  d = { name = 'debug' },
  f = { name = 'files' },
  g = { name = 'git' },
  h = { name = 'git hunk' },
  p = { name = 'project' },
  r = { name = 'refactor/run' },
  s = { name = 'search' },
  t = { name = 'tabs' },
  w = { name = 'windows' }
}, { prefix = '<Space>'})

vim.opt.timeoutlen = 500
