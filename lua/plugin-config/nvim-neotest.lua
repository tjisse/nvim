local set_keymap = vim.api.nvim_set_keymap

vim.g['test#javascript#jest#options'] = "--color=always"
vim.g['test#javascript#jest#file_pattern'] = '\\v(__tests__/.*|(spec|test))\\.(js|mjs|jsx|coffee|ts|tsx)$'

require('neotest').setup({
  adapters = {
    require('neotest-vim-test')({})
  }
})

set_keymap('n', '<Leader>rt', ':lua require(\'neotest\').run.run()<CR>', { silent = true, noremap = true, desc = 'run nearest test' })
set_keymap('n', '<Leader>rT', ':lua require(\'neotest\').run.run(vim.fn.expand("%"))<CR>', { silent = true, noremap = true, desc = 'run all tests in file' })
