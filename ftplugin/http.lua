local bmap = vim.api.nvim_buf_set_keymap

local default_opts = { noremap = true, silent = true }

bmap(0, 'n', '<localleader>e', '<Plug>RestNvim', default_opts)
bmap(0, 'n', '<localleader>p', '<Plug>RestNvimPreview', default_opts)
bmap(0, 'n', '<localleader>l', '<Plug>RestNvimLast', default_opts)
