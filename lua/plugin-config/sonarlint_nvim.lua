require('sonarlint').setup({
   server = {
      cmd = {
         'sonarlint-language-server.cmd',
         '-stdio',
         '-analyzers',
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
      },
   },
   filetypes = {
      'java',
      'javascript',
   },
})
