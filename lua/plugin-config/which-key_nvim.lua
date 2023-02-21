local wk = require('which-key')

wk.setup({
  key_labels = {
    ['<CR>'] = '↵',
    ['<Tab>'] = '⇆',
    ['<space>'] = '⎵',
  }
})

wk.register({
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
