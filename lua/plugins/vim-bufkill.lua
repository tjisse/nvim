return {
  'qpkorr/vim-bufkill',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    vim.g.BufKillCreateMappings = 0
  end,
}
