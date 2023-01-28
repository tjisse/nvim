local set_keymap = vim.keymap.set

require('neogen').setup({ snippet_engine = "vsnip" })

set_keymap('n', '<Leader>rd', ':lua require(\'neogen\').generate()<CR>', { silent = true, noremap = true, desc = 'generate docstring' })
