local actions = require('telescope.actions')
local fb_actions = require('telescope').extensions.file_browser.actions

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
    }
  },
  pickers = {
    lsp_code_actions = {
      theme = 'cursor',
    }
  },
  extensions = {
    file_browser = {
      initial_mode = 'normal',
      hujack_netrw = true,
      mappings = {
        ['n'] = {
          ['-'] = fb_actions.goto_parent_dir
        }
      }
    }
  }
})
