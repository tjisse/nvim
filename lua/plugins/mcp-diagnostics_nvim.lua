return {
  'georgeharker/mcp-diagnostics.nvim',
  config = function()
    require('mcp-diagnostics').setup({
      mode = 'server',
      server = { auto_start_server = true }
    })
  end
}
