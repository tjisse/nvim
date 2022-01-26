local dap = require('dap')
local wk = require('which-key')

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = 'Attach to running Neovim instance',
    host = function()
      local value = vim.fn.input('Host [127.0.0.1]: ')
      if value ~= '' then
        return value
      end
      return '127.0.0.1'
    end,
    port = function()
      local val = tonumber(vim.fn.input('Port: '))
      assert(val, 'Please provide a port number')
      return val
    end,
  }
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host, port = config.port })
end

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/Projects/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}

wk.register({
  d = {
    name = '+debug',
    b = { ':lua require\'dap\'.toggle_breakpoint()<CR>', 'toggle breakpoint', noremap = false, silent = true },
    B = { ':lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>', 'set conditional breakpoint', noremap = false, silent = true },
    c = { ':lua require\'dap\'.continue()<CR>', 'start/continue' , noremap = false, silent = true },
    r = { ':lua require\'dap\'.repl.open()<CR>', 'open repl' , noremap = false, silent = true },
    s = {
      name = '+step',
      i = { ':lua require\'dap\'.step_into()<CR>', 'step into', noremap = false, silent = true },
      o = { ':lua require\'dap\'.step_out()<CR>', 'step out', noremap = false, silent = true },
      s = { ':lua require\'dap\'.step_over()<CR>', 'step over', noremap = false, silent = true },
    },
  },
}, { prefix = '<leader>' })

vim.cmd[[au FileType dap-repl lua require('dap.ext.autocompl').attach()]]
