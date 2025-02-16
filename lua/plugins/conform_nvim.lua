return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require('conform').setup({
      formatters = {
        intellij = {
          command = 'idea.bat',
          require_cwd = false,
          stdin = false,
          args = {
            'format',
            '$FILENAME',
          },
        },
      },
      formatters_by_ft = {
        clojure = { 'zprint' },
        java = { 'intellij' },
      },
      init = function()
        vim.o.formatexpr = 'v:lua.require"conform".formatexpr()'
      end,
    })
  end
}
