return {
  'echasnovski/mini.files',
  event = { 'VeryLazy' },
  config = function()
    local mini_files = require('mini.files')

    mini_files.setup({
      mappings = {
        close       = '<Esc>',
        go_in       = '',
        go_in_plus  = '',
        go_out      = '',
        go_out_plus = '',
      }
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        vim.keymap.set('n', '<CR>', function() mini_files.go_in({ close_on_file = true }) end,
          { buffer = args.data.buf_id })
        vim.keymap.set('n', '-', mini_files.go_out, { buffer = args.data.buf_id })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesActionRename",
      callback = function(event)
        Snacks.rename.on_rename_file(event.data.from, event.data.to)
      end,
    })

    vim.keymap.set('n', '-', function() mini_files.open(vim.api.nvim_buf_get_name(0)) end,
      { silent = true, desc = 'open directory of current file' })
  end
}
