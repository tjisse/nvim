local neotest = require('neotest')

vim.g['test#javascript#jest#options'] = "--color=always"
vim.g['test#javascript#jest#file_pattern'] = '\\v(__tests__/.*|(spec|test))\\.(js|mjs|jsx|coffee|ts|tsx)$'

neotest.setup({
  adapters = {
    require('neotest-vim-test')({})
  }
})

vim.keymap.set('n', '<leader>rt', neotest.run.run, { silent = true, desc = 'run nearest test' })
vim.keymap.set('n', '<leader>rT', function() neotest.run.run(vim.fn.expand("%")) end, { silent = true, desc = 'run all tests in file' })
