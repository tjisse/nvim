return {
  'mfussenegger/nvim-dap',
  cmd = 'DapContinue',
  config = function()
    local dap = require('dap')
    local dapui = require("dapui")

    dapui.setup()

    local dap_breakpoint = {
      error = {
        text = '🔷',
        texthl = 'LspDiagnosticsSignError',
        linehl = '',
        numhl = '',
      },
      rejected = {
        text = '🔶',
        texthl = 'LspDiagnosticsSignHint',
        linehl = '',
        numhl = '',
      },
      stopped = {
        text = '💠',
        texthl = 'LspDiagnosticsSignInformation',
        linehl = 'DiagnosticUnderlineInfo',
        numhl = 'LspDiagnosticsSignInformation',
      },
    }

    vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
    vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
    vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)

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

    dap.adapters.js = {
      type = 'executable',
      command = 'node',
      args = { vim.fn.expand('$MASON/packages/js-debug2-adapter/out/src/nodeDebug.js') },
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
        type = 'js',
        request = 'attach',
        port = 9229,
        -- processId = require('dap.utils').pick_process,
      },
    }

    vim.keymap.set('n', '<leader>dd', dapui.toggle, { silent = true, desc = 'open dap-ui' })
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { silent = true, desc = 'toggle breakpoint' })
    vim.keymap.set('n', '<leader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
      { silent = true, desc = 'set conditional breakpoint' })
    vim.keymap.set('n', '<leader>dc', dap.continue, { silent = true, desc = 'start/continue' })
    vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { silent = true, desc = 'toggle repl' })
    vim.keymap.set('n', '<leader>dsi', dap.step_into, { silent = true, desc = 'step into' })
    vim.keymap.set('n', '<leader>dso', dap.step_out, { silent = true, desc = 'step out' })
    vim.keymap.set('n', '<leader>dss', dap.step_over, { silent = true, desc = 'step over' })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dap-repl',
      callback = function()
        vim.opt_local.number = false
        require('dap.ext.autocompl').attach()
      end
    })
  end,
  dependencies = {
    'theHamsta/nvim-dap-virtual-text',
    'rcarriga/nvim-dap-ui',
    'jbyuki/one-small-step-for-vimkind'
  },
}
