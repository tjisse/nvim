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
        max_length = function() return vim.api.nvim_win_get_width(0) end,
        mode = 2
      }
    }
  },
  sections = {
    lualine_y = { short_cwd },
  },
  extensions = { 'fugitive', 'quickfix', 'mundo', 'nvim-dap-ui' }
}
