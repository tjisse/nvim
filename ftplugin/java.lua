local path = require('mason-core.path')
local _ = require('mason-core.functional')
local platform = require('mason-core.platform')
local lsp_pluginconfig = require('plugin-config.nvim-lspconfig')
local bmap = vim.api.nvim_buf_set_keymap

local default_opts = { noremap = true, silent = true }

local jdtls_install_dir = require('mason-registry.jdtls'):get_install_path()
local java_debug_install_dir = require('mason-registry.java-debug-adapter'):get_install_path()
local executable = vim.env.JAVA_HOME and path.concat { vim.env.JAVA_HOME, 'bin', 'java' } or 'java'
local jar = vim.fn.expand(path.concat { jdtls_install_dir, 'plugins', 'org.eclipse.equinox.launcher_*.jar' })
local lombok = vim.fn.expand(path.concat { jdtls_install_dir, 'lombok.jar' })
local debug_plugin = vim.fn.expand(path.concat { java_debug_install_dir, 'com.microsoft.java.debug.plugin-*.jar' })
local workspace_root = vim.env.WORKSPACE and vim.env.WORKSPACE or path.concat { vim.env.HOME, "workspace" }
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local cmd = {
  platform.is_win and ('%s.exe'):format(executable) or executable,
  '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  '-Dosgi.bundles.defaultStartLevel=4',
  '-Declipse.product=org.eclipse.jdt.ls.core.product',
  platform.is.win and '-DwatchParentProcess=false' or '-DwatchParentProcess=true', -- https://github.com/redhat-developer/vscode-java/pull/847
  '--add-modules=ALL-SYSTEM',
  '--add-opens',
  'java.base/java.util=ALL-UNNAMED',
  '--add-opens',
  'java.base/java.lang=ALL-UNNAMED',
  '--add-opens',
  'java.base/sun.nio.fs=ALL-UNNAMED', -- https://github.com/redhat-developer/vscode-java/issues/2264
  '-javaagent:' .. lombok,
  '-jar',
  jar,
  '-configuration',
  path.concat {
    jdtls_install_dir,
    _.coalesce(
      _.when(platform.is.mac, 'config_mac'),
      _.when(platform.is.linux, 'config_linux'),
      _.when(platform.is.win, 'config_win')
    ),
  },
  '-data',
  path.concat { workspace_root, workspace_dir },
  '-XX:+UseParallelGC',
  '-XX:GCTimeRatio=4',
  '-XX:AdaptiveSizePolicyWeight=90',
  '-Dsun.zip.disableMemoryMapping=true',
  '-Djava.import.generatesMetadataFilesAtProjectRoot=false',
  '-Xmx1G',
  '-Xms100m',
}

local root = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }) or vim.loop.cwd()

local extendedCapabilities = require('jdtls').extendedClientCapabilities
extendedCapabilities.classFileContentsSupport = false

local opts = {
  cmd = cmd,
  on_attach = function(client, bufnr)
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    lsp_pluginconfig.on_attach(client, bufnr)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  root_dir = root,
  settings = {
    java = {
      signatureHelp = { enabled = true };
      contentProvider = { preferred = 'fernflower' };
      completion = {
        favoriteStaticMembers = {
          'org.hamcrest.MatcherAssert.assertThat',
          'org.hamcrest.Matchers.*',
          'org.hamcrest.CoreMatchers.*',
          'org.junit.jupiter.api.Assertions.*',
          'java.util.Objects.requireNonNull',
          'java.util.Objects.requireNonNullElse',
          'org.mockito.Mockito.*',
          'org.mockito.BDDMockito.*',
        },
        importOrder = {
          '',
          'javax',
          'java',
          '#',
        }
      },
      sources = {
        organizeImports = {
          starThreshold = 5,
          staticStarThreshold = 3,
        }
      }
    }
  },
  init_options = {
    extendedCapabilities = extendedCapabilities,
    bundles = {
      vim.fn.glob(debug_plugin)
    },
  }
}
require('jdtls').start_or_attach(opts)

bmap(0, 'n', '<leader>ri', ':lua require(\'jdtls\').organize_imports()<CR>', default_opts)
bmap(0, 'n', '<leader>rev', ':lua require(\'jdtls\').extract_variable()<CR>', default_opts)
bmap(0, 'v', '<leader>rev', '<Esc>:lua require(\'jdtls\').extract_variable(true)<CR>', default_opts)
bmap(0, 'n', '<leader>rec', ':lua require(\'jdtls\').extract_constant()<CR>', default_opts)
bmap(0, 'v', '<leader>rec', '<Esc>:lua require(\'jdtls\').extract_constant(true)<CR>', default_opts)
bmap(0, 'v', '<leader>rem', '<Esc>:lua require(\'jdtls\').extract_method(true)<CR>', default_opts)

vim.api.nvim_buf_create_user_command(0, 'JdtCompile', 'lua require(\'jdtls\').compile()', {})
vim.api.nvim_buf_create_user_command(0, 'JdtUpdateConfig', 'lua require(\'jdtls\').update_project_config()', {})
vim.api.nvim_buf_create_user_command(0, 'JdtJol', 'lua require(\'jdtls\').jol()', {})
vim.api.nvim_buf_create_user_command(0, 'JdtBytecode', 'lua require(\'jdtls\').javap()', {})
vim.api.nvim_buf_create_user_command(0, 'JdtJshell', 'lua require(\'jdtls\').jshell()', {})
vim.api.nvim_create_autocmd('BufWritePost',
  { pattern = '<buffer>', callback = function() require('lint').try_lint() end })

require('blanket').setup({
  report_path = root .. '/target/site/jacoco/jacoco.xml'
})
