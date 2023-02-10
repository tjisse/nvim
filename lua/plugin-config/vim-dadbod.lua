vim.api.nvim_create_autocmd('FileType',
  { pattern = 'sql,mysql,plsql',
    callback = function() require('cmp').setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } }) end })

vim.g.db_ui_force_echo_notifications = true
