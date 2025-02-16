return {
  'chaoren/vim-wordmotion',
  event = { 'InsertEnter' },
  config = function()
    vim.g.wordmotion_uppercase_spaces = '.,;<>()[]{}&*=!+"\''
    vim.cmd[[call wordmotion#reload()]]
  end
}
