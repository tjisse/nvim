local neogit = require('neogit')
local set_keymap = vim.api.nvim_set_keymap

neogit.setup({
  integrations = {
    diffview = true
  }
})

set_keymap('n', '<Leader>gg', ':Neogit<CR>', { silent = true, noremap = true, desc = 'open Neogit' })
