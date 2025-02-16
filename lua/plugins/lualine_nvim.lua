local function short_cwd()
  local cwd = vim.fn.getcwd()
  return cwd:gsub(vim.env.HOME, '~')
end

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = {
    options = {
      theme = 'arctic',
      component_separators = { left = '│', right = '│' },
      section_separators = { left = '', right = '' },
      globalstatus = true,
    },
    sections = {
      lualine_y = { short_cwd },
    },
    extensions = { 'quickfix', 'mundo', 'nvim-dap-ui' }
  }
}
