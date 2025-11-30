return {
  'jedrzejboczar/possession.nvim',
  dependencies = 'tiagovla/scope.nvim',
  event = 'VeryLazy',
  opts = {
    autoload = 'auto_cwd',
    hooks = {
      after_save = function()
        vim.cmd([[ScopeSaveState]])
      end,
      before_load = function()
        vim.cmd([[ScopeLoadState]])
      end,
    }
  }
}
