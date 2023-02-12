local opts = { buffer = true, noremap = true, silent = true }

vim.keymap.set('n', '<localleader>e', '<Plug>RestNvim', opts)
vim.keymap.set('n', '<localleader>p', '<Plug>RestNvimPreview', opts)
vim.keymap.set('n', '<localleader>l', '<Plug>RestNvimLast', opts)
