return {
  'liangxianzhe/nap.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local nap = require('nap')
    nap.setup({
      next_repeat = ']]',
      prev_repeat = '[[',
    })
    nap.map('c', require('nap').gitsigns())
    nap.map('r', require("nap").illuminate())
    nap.map('d', {
      next = { rhs = function() vim.diagnostic.jump({ count = 1 }) end, opts = { desc = "Next diagnostic" } },
      prev = { rhs = function() vim.diagnostic.jump({ count = -1 }) end, opts = { desc = "Last diagnostic" } },
      mode = { "n", "v", "o" },
    })
  end
}
