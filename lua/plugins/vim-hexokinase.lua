return {
  'rrethy/vim-hexokinase',
  ft = { 'css', 'sass', 'scss', 'html' },
  run = 'make hexokinase',
  config = function()
    vim.g.Hexokinase_ftEnabled = { 'css', 'html', 'javascript' }
  end,
}
