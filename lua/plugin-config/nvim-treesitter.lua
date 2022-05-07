require('nvim-treesitter.configs').setup({
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
  },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = '<C-w>',
      node_decremental = '<C-S-w>',
    },
  },
  indent = {
    enable = true,
  }
})
