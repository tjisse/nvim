require('nvim-treesitter.configs').setup({
  autotag = {
    enable = true,
  },
  ensure_installed = {
    'java',
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
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = 'K',
      node_decremental = 'J',
    },
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
    swap = {
      enable = true,
      swap_next = {
        ["<M-l>"] = "@parameter.inner",
      },
      swap_previous = {
        ["<M-h>"] = "@parameter.inner",
      },
    },
  },
})
