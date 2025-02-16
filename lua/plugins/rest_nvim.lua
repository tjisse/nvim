return {
  'rest-nvim/rest.nvim',
  ft = 'http',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    result = {
      split = {
        horizontal = true,
      }
    }
  }
}
