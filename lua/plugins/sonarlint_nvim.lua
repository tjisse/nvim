return {
  'https://gitlab.com/schrieveslaach/sonarlint.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('sonarlint').setup({
      server = {
        cmd = {
          'sonarlint-language-server',
          '-stdio',
          '-analyzers',
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
        },
      },
      filetypes = {
        -- 'java',
        'javascript',
      },
    })
  end,
  dependencies = { 'neovim/nvim-lspconfig' },
}
