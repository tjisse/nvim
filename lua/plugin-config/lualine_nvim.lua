require('lualine').setup {
  options = {
    theme = 'vscode',
    component_separators = { left = '│', right = '│'},
    section_separators = { left = '', right = ''},
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        max_length = vim.o.columns,
        mode = 2
      }
    }
  },
  extentions = { 'fugitive', 'quickfix', 'mundo', 'nvim-dap-ui' }
}
