local substitute = require('substitute')

substitute.setup({
  on_substitute = require('yanky.integration').substitute(),
})

vim.keymap.set('n', 'r', substitute.operator, { silent = true, noremap = true, desc = 'substitute' })
vim.keymap.set('n', 'rr', substitute.line, { silent = true, noremap = true, desc = 'substitute line' })
vim.keymap.set('n', 'R', substitute.eol, { silent = true, noremap = true, desc = 'substitute to end' })
vim.keymap.set('x', 'r', substitute.visual, { silent = true, noremap = true, desc = 'substitute selection' })
