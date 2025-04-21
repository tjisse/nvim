if vim.fn.has('win32') then
  vim.cmd [[runtime! mswin.vim]]
  vim.opt.shell = 'bash'
  vim.opt.shellcmdflag = '-c'
  vim.opt.shellredir = '>%s 2>&1'
  vim.opt.shellquote = ''
  vim.opt.shellxquote = ''
  vim.opt.shellxescape = ''
  vim.opt.shellredir = '>'
  vim.opt.shellpipe = '2>&1| tee'
end

vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.scrolloff = 5
vim.opt.updatetime = 100
vim.opt.sessionoptions = 'blank,buffers,tabpages,globals,curdir,folds,help,terminal,winsize'
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
vim.opt.laststatus = 3
vim.opt.shortmess:append('csATWI')

vim.opt.guifont = 'Iosevka NF:l:h8'

vim.api.nvim_create_autocmd('TermOpen', { command = 'setlocal nonumber | setfiletype terminal' })

local root_dir_markers = { '.git', 'Makefile' }

local root_augroup = vim.api.nvim_create_augroup('Rooter', {})
vim.api.nvim_create_autocmd('BufReadPost', {
  group = root_augroup,
  callback = function()
    local path = vim.api.nvim_buf_get_name(0)
    if path == '' then return end
    path = vim.fs.dirname(path)

    local root_file = vim.fs.find(root_dir_markers, { path = path, upward = true })[1]
    if root_file == nil then return end
    local root = vim.fs.dirname(root_file)

    vim.cmd.tcd(root)
  end
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  update_in_insert = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
})
