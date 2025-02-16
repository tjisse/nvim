return {
  'kevinhwang91/nvim-hlslens',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function() require('scrollbar.handlers.search').setup() end,
}
