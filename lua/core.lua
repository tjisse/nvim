if vim.fn.has('win32') then
  vim.cmd[[runtime! mswin.vim]]
  vim.opt.shell = 'bash'
  vim.opt.shellcmdflag = '-c'
  vim.opt.shellredir = '>%s 2>&1'
  vim.opt.shellquote = ''
  vim.opt.shellxquote = ''
  vim.opt.shellxescape = ''
  vim.opt.shellredir = '>'
  vim.opt.shellpipe = '2>&1| tee'
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.auto_session_enabled = false

vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.cursorcolumn = true
vim.opt.updatetime = 100
vim.opt.sessionoptions = 'blank,curdir,folds,help,tabpages,winsize'
vim.opt.selection = 'inclusive'
vim.opt.diffopt:append('vertical')
