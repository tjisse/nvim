local wk = require('which-key')

wk.register({
  g = {
    name = '+git',
    b = { ':Git blame<CR>', 'fugitive blame', noremap = false, silent = true },
    c = { ':Clap bcommits<CR>', 'commits for current buffer', noremap = false, silent = true },
    C = { ':Git commit --verbose<CR>', 'fugitive commit', noremap = false, silent = true },
    d = { ':Gdiff<CR>', 'fugitive diff', noremap = false, silent = true },
    e = { ':Gedit<CR>', 'fugitive edit', noremap = false, silent = true },
    l = { ':Git log<CR>', 'fugitive log', noremap = false, silent = true } ,
    p = { ':Git push<CR>', 'fugitive push', noremap = false, silent = true },
    r = { ':Gread<CR>', 'fugitive read', noremap = false, silent = true },
    s = { ':Git<CR>', 'fugitive status', noremap = false, silent = true },
    w = { ':Gwrite<CR>', 'fugitive write', noremap = false, silent = true },
  },
}, { prefix = '<leader>' })
