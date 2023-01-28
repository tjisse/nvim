local wk = require('which-key')

local default_opts = unpack({ silent = true, noremap = true })

wk.setup({
  key_labels = {
    ['<CR>'] = '↵',
    ['<Tab>'] = '⇆',
    ['<space>'] = '⎵',
  }
})

wk.register({
  ['1'] = { ':1tabnext<CR>', 'tab 1', { default_opts } },
  ['2'] = { ':2tabnext<CR>', 'tab 2', { default_opts } },
  ['3'] = { ':3tabnext<CR>', 'tab 3', { default_opts } },
  ['4'] = { ':4tabnext<CR>', 'tab 4', { default_opts } },
  ['5'] = { ':5tabnext<CR>', 'tab 5', { default_opts } },
  ['6'] = { ':6tabnext<CR>', 'tab 6', { default_opts } },
  ['7'] = { ':7tabnext<CR>', 'tab 7', { default_opts } },
  ['8'] = { ':8tabnext<CR>', 'tab 8', { default_opts } },
  ['9'] = { ':9tabnext<CR>', 'tab 9', { default_opts } },
  ['<Tab>'] = { ':b#<CR>', 'previous buffer', { default_opts } },
  b = { name = 'buffer' },
  f = { name = 'files' },
  g = { name = 'git' },
  h = { name = 'git hunk' },
  p = { name = 'project' },
  r = { name = 'refactor/run' },
  s = { name = 'search' },
  t = { name = 'tabs' },
  w = { name = 'windows' }
}, { prefix = '<leader>'})

vim.opt.timeoutlen = 500
