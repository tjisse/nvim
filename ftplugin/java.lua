local bmap = vim.api.nvim_buf_set_keymap
local lsp_installer = require('nvim-lsp-installer')

local default_opts = { noremap = true, silent = true }

local available, jdtls = lsp_installer.get_server('jdtls')
if available then
  local default_jdtls_opts = jdtls._default_options
  local opts = {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'}),
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
            'org.mockito.Mockito.*'
          }
        }
      }
    }
  }
  local combined_opts = vim.tbl_deep_extend('force', default_jdtls_opts, opts)
  require('jdtls').start_or_attach(combined_opts)
end

bmap(0, 'n', '<leader>rev', ':lua require(\'jdtls\').extract_variable()<CR>', default_opts)
bmap(0, 'v', '<leader>rev', '<Esc>:lua require(\'jdtls\').extract_variable(true)<CR>', default_opts)
bmap(0, 'n', '<leader>rec', ':lua require(\'jdtls\').extract_constant()<CR>', default_opts)
bmap(0, 'v', '<leader>rec', '<Esc>:lua require(\'jdtls\').extract_constant(true)<CR>', default_opts)
bmap(0, 'v', '<leader>rem', '<Esc>:lua require(\'jdtls\').extract_method(true)<CR>', default_opts)

vim.cmd[[
  command! -buffer JdtCompile lua require('jdtls').compile()
  command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
  command! -buffer JdtJol lua require('jdtls').jol()
  command! -buffer JdtBytecode lua require('jdtls').javap()
  command! -buffer JdtJshell lua require('jdtls').jshell()
  au BufWritePost <buffer> lua require('lint').try_lint()
]]
