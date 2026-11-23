return {
  'tiagovla/scope.nvim',
  opts = { hooks = { pre_tab_leave = function() require('config.project').save() end } },
}
