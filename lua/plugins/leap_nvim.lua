return {
  'ggandor/leap.nvim',
  commit = "a755cea5ec06191b46702ac8fde8ef03ad2fbdeb",
  dependencies = { 'tpope/vim-repeat' },
  config = function() require('leap').add_default_mappings() end
}
