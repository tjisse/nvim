local mini_files = require('mini.files')

mini_files.setup({
  mappings = {
    close = '<Esc>',
  }
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    vim.keymap.set('n', '<CR>', function() mini_files.go_in({ close_on_file = true }) end, { buffer = args.data.buf_id })
    vim.keymap.set('n', '-', mini_files.go_out, { buffer = args.data.buf_id })
  end,
})
