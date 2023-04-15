local path = require('mason-core.path')
local sonarlint_path = path.concat({ vim.fn.stdpath('data'), 'sonarlint' })

require('sonarlint').setup({
   server = {
      cmd = {
         'java', '-jar', path.concat({ sonarlint_path, 'sonarlint-language-server.jar' }),
         '-stdio',
         '-analyzers', path.concat({ sonarlint_path, 'sonar-java-plugin.jar' }),
         path.concat({ sonarlint_path, 'sonar-javascript-plugin.jar' }),
      }
   },
   filetypes = {
      'java',
      'javascript',
   }
})
