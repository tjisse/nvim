return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        clojure = { 'zprint' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
      },
      init = function()
        vim.o.formatexpr = 'v:lua.require"conform".formatexpr()'
      end,
    })
  end
}
