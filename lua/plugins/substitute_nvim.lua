return {
  'gbprod/substitute.nvim',
  event = { 'BufReadPost' },
  config = function()
    local substitute = require('substitute')

    substitute.setup({
      on_substitute = require('yanky.integration').substitute(),
    })

    vim.keymap.set('n', 'gR', substitute.operator, { silent = true, desc = 'substitute' })
    vim.keymap.set('x', 'gR', substitute.visual, { silent = true, desc = 'substitute selection' })
  end
}
