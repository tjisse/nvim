return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'java',
        'scala',
        'clojure',
        'fennel',
        'lua',
        'vim',
        'c',
        'cpp',
        'swift',
        'cmake',
        'javascript',
        'typescript',
        'tsx',
        'html',
        'css',
        'scss',
        'json',
        'yaml',
        'xml',
        'bash',
        'dockerfile',
        'http',
        'markdown',
        'regex',
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
        swap = {
          enable = true,
          swap_next = {
            ["<M-S-l>"] = "@parameter.inner",
          },
          swap_previous = {
            ["<M-S-h>"] = "@parameter.inner",
          },
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-S-k>',
          node_incremental = '<C-S-k>',
          node_decremental = '<C-S-j>',
        },
      },
    })
  end
}
