local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
    prompt_prefix = '  ',
    layout_config = {
      height = 0.5,
    }
  },
  pickers = {
    lsp_code_actions = {
      theme = 'cursor',
    }
  },
})
