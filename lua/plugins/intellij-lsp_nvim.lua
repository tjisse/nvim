return {
  'JetBrains/intellij-lsp.nvim',
  lazy = false,
  dependencies = { 'mfussenegger/nvim-dap', 'saghen/blink.cmp' },
  opts = {
    -- Blink owns completion and signature help; keep our theme and Git tooling.
    autotrigger = false,
    completeopt = false,
    enter_accepts_completion = false,
    signature_help = false,
    document_highlight = false,
    references = false,
    colorscheme = false,
    git = false,
    keymaps = { prefix = '<localleader>' },
  },
  config = function(_, opts)
    -- The plugin starts its client directly, so it does not read vim.lsp.config('*').
    local client = require('intellij-lsp.client')
    local capabilities = client.capabilities
    client.capabilities = function()
      return require('blink.cmp').get_lsp_capabilities(capabilities())
    end
    require('intellij-lsp').setup(opts)
  end,
}
