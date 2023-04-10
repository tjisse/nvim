local jdtls = require('jdtls')
local path = require('mason-core.path')
local _ = require('mason-core.functional')
local platform = require('mason-core.platform')
local lsp_pluginconfig = require('plugin-config.nvim-lspconfig')

local jdtls_install_dir = require('mason-registry').get_package('jdtls'):get_install_path()
local java_test_install_dir = require('mason-registry').get_package('java-test'):get_install_path()
local java_debug_install_dir = require('mason-registry').get_package('java-debug-adapter'):get_install_path()
local executable = vim.env.JAVA_HOME and path.concat({ vim.env.JAVA_HOME, 'bin', 'java' }) or 'java'
local jar = vim.fn.expand(path.concat({ jdtls_install_dir, 'plugins', 'org.eclipse.equinox.launcher_*.jar' }))
local lombok = vim.fn.expand(path.concat({ jdtls_install_dir, 'lombok.jar' }))
local workspace_root = vim.env.WORKSPACE and vim.env.WORKSPACE or path.concat { vim.env.HOME, "workspace" }
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local function add_plugin_jars_to_bundles(bundles, plugin_install_dir)
  local jar_path = vim.fn.expand(path.concat({ plugin_install_dir, 'extension', 'server', '*.jar' }))
  local plugin_bundles = vim.split(jar_path, '\n')
  for _, bundle in ipairs(plugin_bundles) do
    table.insert(bundles, bundle)
  end
end

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

local extendedCapabilities = jdtls.extendedClientCapabilities
extendedCapabilities.classFileContentsSupport = false

local bundles = {}
add_plugin_jars_to_bundles(bundles, java_test_install_dir)
add_plugin_jars_to_bundles(bundles, java_debug_install_dir)

local opts = {
  cmd = cmd,
  on_attach = function(client, bufnr)
    jdtls.setup_dap({ hotcodereplace = 'auto' })
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
          'org.assertj.core.api.Assertions.*',
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
      },
      maven = {
        downloadSources = true,
        updateSnapshots = true
      }
    }
  },
  init_options = {
    extendedCapabilities = extendedCapabilities,
    bundles = bundles,
  },
}
jdtls.start_or_attach(opts)

vim.keymap.set('n', '<Space>ri', jdtls.organize_imports, { silent = true, buffer = true, desc = 'organize imports' })
vim.keymap.set('n', '<Space>rev', jdtls.extract_variable, { silent = true, buffer = true, desc = 'extract variable' })
vim.keymap.set('v', '<Space>rev', function() jdtls.extract_variable(true) end, { silent = true, buffer = true, desc = 'extract variable' })
vim.keymap.set('n', '<Space>rec', jdtls.extract_constant, { silent = true, buffer = true, desc = 'extract constant' })
vim.keymap.set('v', '<Space>rec', function() jdtls.extract_constant(true) end, { silent = true, buffer = true, desc = 'extract constant' })
vim.keymap.set('v', '<Space>rem', function() jdtls.extract_method(true) end, { silent = true, buffer = true, desc = 'extract method' })

vim.api.nvim_buf_create_user_command(0, 'JdtCompile', 'lua require(\'jdtls\').compile()', {})
vim.api.nvim_buf_create_user_command(0, 'JdtUpdateConfig', 'lua require(\'jdtls\').update_project_config()', {})
vim.api.nvim_buf_create_user_command(0, 'JdtJol', 'lua require(\'jdtls\').jol()', {})
vim.api.nvim_buf_create_user_command(0, 'JdtBytecode', 'lua require(\'jdtls\').javap()', {})
vim.api.nvim_buf_create_user_command(0, 'JdtJshell', 'lua require(\'jdtls\').jshell()', {})

vim.keymap.set('n', '<Space>rt', jdtls.test_nearest_method, { silent = true, buffer = true, desc = 'run nearest test' })
vim.keymap.set('n', '<Space>rT', jdtls.test_class, { silent = true, buffer = true, desc = 'run all tests in file' })

require('blanket').setup({
  report_path = root .. '/target/site/jacoco/jacoco.xml'
})
