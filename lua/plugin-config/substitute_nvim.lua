local substitute = require('substitute')

substitute.setup({
  on_substitute = require('yanky.integration').substitute(),
})

vim.keymap.set('n', 'r', substitute.operator, { silent = true, desc = 'substitute' })
vim.keymap.set('n', 'rr', substitute.line, { silent = true, desc = 'substitute line' })
vim.keymap.set('n', 'R', substitute.eol, { silent = true, desc = 'substitute to end' })
vim.keymap.set('x', 'r', substitute.visual, { silent = true, desc = 'substitute selection' })
