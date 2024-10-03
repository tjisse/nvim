local wk = require('which-key')

wk.setup({
  replace = {
    ['<CR>'] = '↵',
    ['<Tab>'] = '⇆',
    ['<leader>'] = '⎵',
  }
})

wk.add({
  { "<leader><Tab>", ":b#<CR>",             desc = "previous buffer" },
  { "<leader>a",     group = "avante" },
  { "<leader>b",     group = "buffer" },
  { "<leader>d",     group = "debug" },
  { "<leader>f",     group = "files" },
  { "<leader>g",     group = "git" },
  { "<leader>h",     group = "git hunk" },
  { "<leader>p",     group = "project" },
  { "<leader>r",     group = "refactor/run" },
  { "<leader>s",     group = "search" },
  { "<leader>t",     group = "tabs" },
  { "<leader>w",     group = "windows" },
})

vim.opt.timeoutlen = 500
