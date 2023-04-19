require('nvim-treesitter.configs').setup({
  autotag = {
    enable = true,
  },
  ensure_installed = {
    'java',
    'scala',
    'clojure',
    'fennel',
    'lua',
    'vim',
    'javascript',
    'typescript',
    'tsx',
    'html',
    'css',
    'scss',
    'json',
    'yaml',
    'bash',
    'dockerfile',
    'http',
    'markdown',
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",
      },
    },
  },
  node_movement = {
    enable = true,
    keymaps = {
      move_up = '<M-k>',
      move_down = '<M-j>',
      move_left = '<M-h>',
      move_right = '<M-l>',
      swap_left = '<M-S-h>',
      swap_right = '<M-S-l>',
      select_current_node = '<leader><CR>',
    },
    swappable_textobjects = {'@parameter.inner', '@parameter.outer'},
    allow_switch_parents = false,
    allow_next_parent = true,
  },
})

vim.api.nvim_set_hl(0, "CrazyNodeMovementCurrent", require('lush_theme.arctic').SelectionHighlightBackground)
vim.treesitter.language.register("xml", {"xml", "html"})
