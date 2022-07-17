vim.g.lightline = {
  colorscheme = 'one',
  active = {
    right = {
      { 'lineinfo' },
      { 'lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok' },
      { 'percent' },
      { 'fileformat', 'fileencoding', 'filetype' },
      { 'lsp_status' }
    }
  }
}

vim.call('lightline#lsp#register')
