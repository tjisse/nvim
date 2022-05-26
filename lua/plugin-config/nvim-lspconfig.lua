local lsp_installer = require('nvim-lsp-installer')
local wk = require('which-key')
local map = vim.api.nvim_set_keymap

local default_opts = { noremap = true, silent = true }

vim.opt.shortmess:append('c')
vim.cmd[[autocmd CursorMoved * lua vim.diagnostic.open_float({focusable=false})]]

lsp_installer.on_server_ready(function(server)
  if server.name ~= 'jdtls' then
    local opts = {
      capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
    server:setup(opts)
  end
end)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = false,
  }
)

vim.g.lsp_utils_location_opts = {
    height = 24,
    mode = 'editor',
    preview = {
      title = 'Location Preview',
      border = true
    },
}

vim.g.lsp_utils_symbols_opts = {
  height = 24,
  mode = 'editor',
  preview = {
    title = 'Symbols Preview',
    border = true
  },
  prompt = {},
}

map('i', '<c-space>', '<Plug>(completion_trigger)', default_opts)
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', default_opts)
map('n', 'gD', ':lua vim.lsp.buf.implementation()<CR>', default_opts)
map('n', '<c-p>', ':lua vim.lsp.buf.signature_help()<CR>', default_opts)
map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', default_opts)
map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', default_opts)
map('n', 'gs', ':lua vim.lsp.buf.document_symbol()<CR>', default_opts)
map('n', 'gw', ':lua vim.lsp.buf.workspace_symbol("")<CR>', default_opts)
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', default_opts)
map('n', '1gd', ':lua vim.lsp.buf.declaration()<CR>', default_opts)
map('n', 'dn', ':lua vim.lsp.diagnostic.goto_next()<CR>', default_opts)
map('n', 'dN', ':lua vim.lsp.diagnostic.goto_prev()<CR>', default_opts)
map('n', 'dq', ':lua vim.lsp.diagnostic.set_qflist()<CR>', default_opts)
map('n', 'dl', ':lua vim.lsp.diagnostic.set_loclist()<CR>', default_opts)
map('n', '<M-CR>', ':lua vim.lsp.buf.code_action()<CR>', default_opts)
map('i', '<M-CR>', '<C-o>:lua vim.lsp.buf.code_action()<CR>', default_opts)

wk.register({
  ['='] = { ':lua vim.lsp.buf.formatting()<CR>', 'format buffer', noremap = true, silent = true },
  r = {
    name = 'refactor',
    r = { ':lua vim.lsp.buf.rename()<CR>', 'rename', noremap = true, silent = true },
  }
}, { prefix = '<leader>' })
