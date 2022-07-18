local wk = require('which-key')
local lspconfig = require('lspconfig')
local map = vim.keymap.set

local on_attach = function (client, bufnr)
  local buffer_opts = { noremap = true, silent = true, buffer = bufnr }
  map('i', '<c-space>', '<Plug>(completion_trigger)', buffer_opts)
  map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', buffer_opts)
  map('n', 'gD', ':lua vim.lsp.buf.implementation()<CR>', buffer_opts)
  map('n', '<c-p>', ':lua vim.lsp.buf.signature_help()<CR>', buffer_opts)
  map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', buffer_opts)
  map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', buffer_opts)
  map('n', 'gs', ':lua vim.lsp.buf.document_symbol()<CR>', buffer_opts)
  map('n', 'gw', ':lua vim.lsp.buf.workspace_symbol("")<CR>', buffer_opts)
  map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', buffer_opts)
  map('n', '1gd', ':lua vim.lsp.buf.declaration()<CR>', buffer_opts)
  map('n', 'dn', ':lua vim.diagnostic.goto_next()<CR>', buffer_opts)
  map('n', 'dN', ':lua vim.diagnostic.goto_prev()<CR>', buffer_opts)
  map('n', 'dq', ':lua vim.diagnostic.set_qflist()<CR>', buffer_opts)
  map('n', 'dl', ':lua vim.diagnostic.set_loclist()<CR>', buffer_opts)
  map('n', '<M-CR>', ':lua vim.lsp.buf.code_action()<CR>', buffer_opts)
  map('i', '<M-CR>', '<C-o>:lua vim.lsp.buf.code_action()<CR>', buffer_opts)

  wk.register({
    ['='] = { ':lua vim.lsp.buf.format()<CR>', 'format buffer', noremap = true, silent = true, buffer = bufnr },
    r = {
      name = 'refactor',
      r = { ':lua vim.lsp.buf.rename()<CR>', 'rename', noremap = true, silent = true, buffer = bufnr },
    }
  }, { prefix = '<leader>' })
end

require("nvim-lsp-installer").setup({
  automatic_installation = true,
})

vim.opt.shortmess:append('c')
vim.api.nvim_create_autocmd('CursorHold',
  { pattern = '*', callback = function() vim.diagnostic.open_float({ focusable = false }) end })

lspconfig.angularls.setup({
  on_attach = on_attach,
})

lspconfig.bashls.setup({
  on_attach = on_attach,
})

lspconfig.clojure_lsp.setup({
  on_attach = on_attach,
})

lspconfig.cssls.setup({
  on_attach = on_attach,
})

lspconfig.html.setup({
  on_attach = on_attach,
})

lspconfig.jdtls.setup({
  on_attach = on_attach,
  use_lombok_agent = true,
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
})

lspconfig.sqlls.setup({
  on_attach = on_attach,
})

local luadev = require('lua-dev').setup({
  on_attach = on_attach,
})
lspconfig.sumneko_lua.setup(luadev)

lspconfig.tsserver.setup({
  on_attach = on_attach,
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = false,
})
