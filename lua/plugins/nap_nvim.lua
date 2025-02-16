return {
  'liangxianzhe/nap.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('nap').setup({
      next_repeat = ']]',
      prev_repeat = '[[',
    })
    require('nap').map('c', require('nap').gitsigns())
  end
}
