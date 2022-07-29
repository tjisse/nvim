vim.cmd[[runtime! mswin.vim]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.auto_session_enabled = false

vim.opt.mouse = 'a'
vim.opt.guifont = 'Iosevka Slab:h10'
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.cursorcolumn = true
vim.opt.updatetime = 100
vim.opt.sessionoptions = 'blank,curdir,folds,help,tabpages,winsize'
vim.opt.selection = 'inclusive'
vim.opt.cmdheight = 0
vim.opt.shell = 'powershell'
vim.opt.shellquote = ''
vim.opt.shellpipe = '|'
vim.opt.shellxquote = ''
vim.opt.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command'
vim.opt.shellredir = '| Out-File -Encoding UTF'
