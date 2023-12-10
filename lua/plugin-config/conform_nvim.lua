require('conform').setup({
  formatters_by_ft = {
    clojure = { 'cljstyle' },
  },
  init = function()
    vim.o.formatexpr = 'v:lua.require"conform".formatexpr()'
  end,
})
