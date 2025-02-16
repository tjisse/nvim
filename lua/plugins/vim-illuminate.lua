return {
  'rrethy/vim-illuminate',
  event = { 'BufReadPost' },
  config = function()
    require('illuminate').configure({
      providers = {
        'lsp',
        'treesitter',
      },
    })
  end
}
