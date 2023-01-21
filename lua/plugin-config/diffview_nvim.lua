local set_keymap = vim.api.nvim_set_keymap

require('diffview').setup({
  enhanced_diff_hl = true,
  view = {
    merge_tool = {
      layout = 'diff3_mixed'
    }
  }
})

set_keymap('n', '<Leader>gd', ':DiffviewOpen<CR>', { silent = true, normap = true, desc = 'open Diffview' })
