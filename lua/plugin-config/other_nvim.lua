local clojure_alternative_targets = {
  { context = 'implementation', target = '/src/%1/%2.%3' },
  { context = 'test',           target = '/test/%1/%2_test.%3' },
}

local java_alternative_targets = {
  { context = 'implementation', target = '/src/main/%1/%2.java' },
  { context = 'test',           target = '/src/test/%1/%2Test.java' },
}

require('other-nvim').setup({
  mappings = {
    {
      context = 'clojure/clojurescript implementation file',
      pattern = '/src/(.*)/([^/]+).(cljs?)$',
      target = clojure_alternative_targets,
    },
    {
      context = 'clojure/clojurescript test file',
      pattern = '/test/(.*)/([^/]+)_test.(cljs?)$',
      target = clojure_alternative_targets,
    },
    {
      context = 'java implementation file',
      pattern = '/src/main/(.*)/([^/]+).java$',
      target = java_alternative_targets,
    },
    {
      context = 'java test file',
      pattern = '/src/test/(.*)/([^/]+)Test.java$',
      target = java_alternative_targets,
    },
  },
})

vim.keymap.set('n', '<leader>po', '<Cmd>:Other<CR>', { silent = true, desc = 'switch to related file' })
