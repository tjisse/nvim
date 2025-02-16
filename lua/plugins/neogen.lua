return {
  'danymat/neogen',
  event = { 'InsertEnter' },
  config = function()
    local neogen = require('neogen')

    neogen.setup({ snippet_engine = "vsnip" })

    vim.keymap.set('n', '<leader>rd', neogen.generate, { silent = true, desc = 'generate docstring' })
  end,
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
}
