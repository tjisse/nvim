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
  vim.opt.shellslash = true
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.auto_session_enabled = false

vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.updatetime = 100
vim.opt.sessionoptions = 'blank,curdir,folds,help,tabpages,winsize'
vim.opt.selection = 'inclusive'
vim.opt.cmdheight = 0
vim.opt.diffopt:append('vertical')
vim.opt.diffopt:append('linematch:50')
vim.opt.splitkeep = 'screen'
vim.opt.listchars = 'tab:→ ,eol: ,trail:·,extends:↷,precedes:↶'
vim.opt.fillchars:append('diff: ')
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.showcmd = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fileformats = 'unix,dos'
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus,unnamed'
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'

vim.opt.guifont = "Iosevka NF:l:h10"

vim.api.nvim_create_autocmd('TermOpen', { command = 'setlocal nonumber | setfiletype terminal' })

vim.cmd[[
if exists('g:nvui')
  NvuiCursorHideWhileTyping 1
  NvuiCursorAnimationDuration 0.25
endif
]]
