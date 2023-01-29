local function short_cwd()
  local cwd = vim.fn.getcwd()
  return cwd:gsub(vim.env.HOME, '~')
end

require('lualine').setup {
  options = {
    theme = 'arctic',
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
  sections = {
    lualine_y = { short_cwd },
  },
  extentions = { 'quickfix', 'mundo', 'nvim-dap-ui' }
}
