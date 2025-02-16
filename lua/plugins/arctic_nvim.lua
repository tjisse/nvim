return {
  'rockyzhang24/arctic.nvim',
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    vim.cmd [[
      colorscheme arctic
      hi DiffText guibg=#1f6a98 guifg=none
    ]]
  end
}
