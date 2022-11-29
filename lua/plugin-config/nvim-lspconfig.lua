local wk = require('which-key')
local lspconfig = require('lspconfig')
local map = vim.keymap.set

local on_attach = function(client, bufnr)
  local buffer_opts = { noremap = true, silent = true, buffer = bufnr }
  map('i', '<c-space>', '<Plug>(completion_trigger)', buffer_opts)
  map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', buffer_opts)
  map('n', 'gD', ':lua vim.lsp.buf.implementation()<CR>', buffer_opts)
  map('n', '<c-p>', ':lua vim.lsp.buf.signature_help()<CR>', buffer_opts)
  map('i', '<c-p>', '<C-o>:lua vim.lsp.buf.signature_help()<CR>', buffer_opts)
  map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', buffer_opts)
  map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', buffer_opts)
  map('n', 'gs', ':lua vim.lsp.buf.document_symbol()<CR>', buffer_opts)
  map('n', 'gw', ':lua vim.lsp.buf.workspace_symbol("")<CR>', buffer_opts)
  map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', buffer_opts)
  map('n', '1gd', ':lua vim.lsp.buf.declaration()<CR>', buffer_opts)
  map('n', 'dn', ':lua vim.diagnostic.goto_next({ float = false })<CR>', buffer_opts)
  map('n', 'dN', ':lua vim.diagnostic.goto_prev({ float = false })<CR>', buffer_opts)
  map('n', 'dq', ':lua vim.diagnostic.setqflist()<CR>', buffer_opts)
  map('n', 'dl', ':lua vim.diagnostic.setloclist()<CR>', buffer_opts)
  map('n', '<M-CR>', ':lua vim.lsp.buf.code_action()<CR>', buffer_opts)
  map('i', '<M-CR>', '<C-o>:lua vim.lsp.buf.code_action()<CR>', buffer_opts)
  map('v', '<M-CR>', ':lua vim.lsp.buf.code_action()<CR>', buffer_opts)

  wk.register({
    ['='] = { ':lua vim.lsp.buf.format()<CR>', 'format buffer', noremap = true, silent = true, buffer = bufnr },
    r = {
      name = 'refactor',
      r = { ':lua vim.lsp.buf.rename()<CR>', 'rename', noremap = true, silent = true, buffer = bufnr },
    }
  }, { prefix = '<leader>' })
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
