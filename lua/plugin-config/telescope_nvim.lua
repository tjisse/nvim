local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    mappings = {
      n = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
    prompt_prefix = '  ',
    layout_config = {
      height = 0.5,
    },
    path_display = {
      truncate = true,
    },
  },
  pickers = {
    lsp_code_actions = {
      theme = 'cursor',
    }
  },
})
