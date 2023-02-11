local substitute = require('substitute')

substitute.setup({
  on_substitute = require('yanky.integration').substitute(),
})

vim.keymap.set('n', 'gr', substitute.operator, { silent = true, noremap = true, desc = 'substitute' })
vim.keymap.set('n', 'grr', substitute.line, { silent = true, noremap = true, desc = 'substitute line' })
vim.keymap.set('n', 'gR', substitute.eol, { silent = true, noremap = true, desc = 'substitute to end' })
vim.keymap.set('x', 'gr', substitute.visual, { silent = true, noremap = true, desc = 'substitute selection' })
