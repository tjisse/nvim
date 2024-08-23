local wk = require('which-key')

wk.setup({
  replace = {
    ['<CR>'] = '↵',
    ['<Tab>'] = '⇆',
    ['<space>'] = '⎵',
  }
})

wk.add({
  { "<Space><Tab>", ":b#<CR>",             desc = "previous buffer" },
  { "<Space>b",     group = "buffer" },
  { "<Space>d",     group = "debug" },
  { "<Space>f",     group = "files" },
  { "<Space>g",     group = "git" },
  { "<Space>h",     group = "git hunk" },
  { "<Space>p",     group = "project" },
  { "<Space>r",     group = "refactor/run" },
  { "<Space>s",     group = "search" },
  { "<Space>t",     group = "tabs" },
  { "<Space>w",     group = "windows" },
})

vim.opt.timeoutlen = 500
