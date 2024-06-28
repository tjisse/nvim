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
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.fsharp = {
  install_info = {
    url = "https://github.com/ionide/tree-sitter-fsharp",
    branch = "main",
    files = {"src/scanner.c", "src/parser.c" },
  },
  filetype = "fsharp",
}

vim.treesitter.language.register("xml", { "xml", "html" })
