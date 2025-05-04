return {
  'nvim-neotest/neotest',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-neotest/nvim-nio',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
    'marilari88/neotest-vitest',
  },
  config = function()
    local neotest = require('neotest')

    neotest.setup({
      adapters = {
        require('neotest-jest')({}),
        require('neotest-vitest'),
      }
    })

    vim.keymap.set('n', '<leader>rt', neotest.run.run, { silent = true, desc = 'run nearest test' })
    vim.keymap.set('n', '<leader>rT', function() neotest.run.run(vim.fn.expand('%')) end,
      { silent = true, desc = 'run all tests in file' })
  end
}
