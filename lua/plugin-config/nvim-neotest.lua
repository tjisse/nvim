vim.g['test#javascript#jest#options'] = "--color=always"
vim.g['test#javascript#jest#file_pattern'] = '\\v(__tests__/.*|(spec|test))\\.(js|mjs|jsx|coffee|ts|tsx)$'

require('neotest').setup({
  adapters = {
    require('neotest-vim-test')({})
  }
})
