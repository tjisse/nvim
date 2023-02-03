local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  local opts = unpack({ silent = true, buffer = bufnr })
  vim.keymap.set('i', '<c-Space>', '<Plug>(completion_trigger)', { opts })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { opts })
  vim.keymap.set('n', 'gD', vim.lsp.buf.implementation, { opts })
  vim.keymap.set('n', '<c-p>', vim.lsp.buf.signature_help, { opts })
  vim.keymap.set('i', '<c-p>', '<C-o>:lua vim.lsp.buf.signature_help()<CR>', { opts })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { opts })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { opts })
  vim.keymap.set('n', 'gs', vim.lsp.buf.document_symbol, { opts })
  vim.keymap.set('n', 'gw', function() vim.lsp.buf.workspace_symbol("") end, { opts })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { opts })
  vim.keymap.set('n', '1gd', vim.lsp.buf.declaration, { opts })
  vim.keymap.set('n', 'dn', function() vim.diagnostic.goto_next({ float = false }) end, { opts })
  vim.keymap.set('n', 'dN', function() vim.diagnostic.goto_prev({ float = false }) end, { opts })
  vim.keymap.set('n', 'dq', vim.diagnostic.setqflist, { opts })
  vim.keymap.set('n', 'dl', vim.diagnostic.setloclist, { opts })
  vim.keymap.set('n', '<M-CR>', vim.lsp.buf.code_action, { opts })
  vim.keymap.set('i', '<M-CR>', '<C-o>:lua vim.lsp.buf.code_action()<CR>', { opts })
  vim.keymap.set('v', '<M-CR>', vim.lsp.buf.code_action, { opts })
  vim.keymap.set({ 'n', 'v' }, '=', vim.lsp.buf.format, { opts, desc = 'format buffer/selection' })
  vim.keymap.set({ 'n', 'v' }, '<Space>rr', vim.lsp.buf.rename, { opts, desc = 'rename' })
end

require('mason').setup()
require('mason-lspconfig').setup({
  automatic_installation = true,
})

vim.opt.shortmess:append('c')

local cmp_nvim_lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.angularls.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.bashls.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.clojure_lsp.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.cssls.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.html.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.jsonls.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.sqlls.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.html.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.jsonls.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.lemminx.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.yamlls.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.sqlls.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

require('neodev').setup({})
lspconfig.sumneko_lua.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.tsserver.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
})

lspconfig.cucumber_language_server.setup({
  capabilities = cmp_nvim_lsp_capabilities,
  on_attach = on_attach,
  settings = {
    cucumber = {
      features = {
        'src/test/resources/features/**/*.feature',
        'itest/src/test/resources/features/**/*.feature',
        'features/**/*.feature'
      },
      glue = {
        'src/test/java/**/*.java',
        'itest/src/test/java/**/*.java',
        'features/**/*.ts',
        'features/**/*.js'
      },
    },
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.diagnostic.config({ virtual_text = false })

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = true,
  virtual_lines = { only_current_line = true },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

return { on_attach = on_attach }
