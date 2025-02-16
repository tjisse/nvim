return {
  'jedrzejboczar/possession.nvim',
  dependencies = 'tiagovla/scope.nvim',
  event = 'VeryLazy',
  opts = {
    autoload = 'auto_cwd',
    autoswitch = {
      enable = true,
    },
    save_hook = function()
      vim.cmd([[ScopeSaveState]])
    end,
    post_hook = function()
      vim.cmd([[ScopeLoadState]])
    end,
  }
}
