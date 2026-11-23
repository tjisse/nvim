local function swift_lldb()
  if vim.fn.executable('xcrun') == 1 then
    local result = vim.system({ 'xcrun', '--find', 'lldb-dap' }, { text = true }):wait()
    if result.code == 0 then
      local path = vim.trim(result.stdout or '')
      if vim.fn.executable(path) == 1 then return path end
    end
  end

  local swift = vim.fn.exepath('swift')
  if swift ~= '' then
    swift = vim.uv.fs_realpath(swift) or swift
    local path = vim.fs.joinpath(vim.fs.dirname(swift), 'lldb-dap')
    if vim.fn.executable(path) == 1 then return path end
  end
  return vim.fn.exepath('lldb-dap')
end

return {
  'mfussenegger/nvim-dap',
  lazy = false,
  dependencies = {
    'theHamsta/nvim-dap-virtual-text',
    { 'rcarriga/nvim-dap-ui', dependencies = { 'nvim-neotest/nvim-nio' } },
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    dapui.setup()
    require('nvim-dap-virtual-text').setup()

    dap.listeners.after.event_initialized['user-ui'] = function(session)
      if not session.config.noDebug then dapui.open() end
    end
    dap.listeners.before.event_terminated['user-ui'] = function() dapui.close() end
    dap.listeners.before.event_exited['user-ui'] = function() dapui.close() end
    dap.listeners.after.disconnect['user-ui'] = function() dapui.close() end

    local js_adapter = {
      type = 'server',
      host = '127.0.0.1',
      port = '${port}',
      executable = { command = 'js-debug-adapter', args = { '${port}', '127.0.0.1' } },
    }
    dap.adapters['pwa-node'] = js_adapter
    dap.adapters['pwa-chrome'] = js_adapter

    local node_launch = {
      type = 'pwa-node', request = 'launch', name = 'Node: launch current file',
      program = '${file}', cwd = '${workspaceFolder}', sourceMaps = true,
    }
    local node_attach = {
      type = 'pwa-node', request = 'attach', name = 'Node: attach to process',
      processId = require('dap.utils').pick_process, cwd = '${workspaceFolder}',
      sourceMaps = true,
    }
    local browser = {
      type = 'pwa-chrome', request = 'launch', name = 'Chrome: launch URL',
      url = function()
        local url = vim.fn.input('URL: ', 'http://localhost:3000')
        return url ~= '' and url or dap.ABORT
      end,
      webRoot = '${workspaceFolder}', sourceMaps = true,
    }
    local typescript_launch = vim.tbl_extend('force', node_launch, {
      name = 'Node: launch compiled JavaScript',
      program = function()
        local path = vim.fn.input('JavaScript entry point: ', vim.fn.getcwd() .. '/', 'file')
        return path ~= '' and path or dap.ABORT
      end,
      outFiles = { '${workspaceFolder}/**/*.js', '!**/node_modules/**' },
    })
    dap.configurations.javascript = { node_launch, node_attach, browser }
    dap.configurations.javascriptreact = { node_launch, node_attach, browser }
    dap.configurations.typescript = { typescript_launch, node_attach, browser }
    dap.configurations.typescriptreact = { typescript_launch, node_attach, browser }

    dap.adapters.swift = function(callback)
      local command = swift_lldb()
      if command == '' then
        vim.notify('Swift debugging needs lldb-dap from the Swift toolchain on PATH', vim.log.levels.ERROR)
        return
      end
      callback({ type = 'executable', command = command })
    end
    dap.configurations.swift = {
      {
        name = 'Swift: launch executable', type = 'swift', request = 'launch',
        program = function() return require('dap.utils').pick_file({ executables = true }) end,
        cwd = '${workspaceFolder}',
      },
      {
        name = 'Swift: attach to process', type = 'swift', request = 'attach',
        pid = require('dap.utils').pick_process,
      },
    }

    dap.adapters.clojure = {
      type = 'executable', command = 'clojure',
      args = {
        '-Sdeps', '{:deps {uk.me.oli/clojure-dap {:mvn/version "0.1.311"}}}',
        '-X', 'clojure-dap.main/run',
      },
      options = { initialize_timeout_sec = 60 },
    }
    dap.configurations.clojure = {
      { name = 'Clojure: attach to nREPL', type = 'clojure', request = 'attach' },
    }

    local function start_or_continue()
      local ft = vim.bo.filetype
      if not dap.session() and (ft == 'java' or ft == 'kotlin') then
        require('intellij-lsp.run').run_at_cursor(false)
      else
        dap.continue()
      end
    end

    local function debug_test()
      local ft = vim.bo.filetype
      if ft == 'java' or ft == 'kotlin' then
        require('intellij-lsp.test').run_at_cursor(false)
      elseif ft == 'scala' then
        local configs = dap.configurations.scala or {}
        if configs[2] then dap.run(configs[2])
        else vim.notify('Metals is not ready to debug tests', vim.log.levels.WARN) end
      elseif vim.tbl_contains({ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }, ft) then
        require('neotest').run.run({ strategy = 'dap' })
      else
        vim.notify('Use the debug session for this language to run tests', vim.log.levels.INFO)
      end
    end

    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: toggle breakpoint' })
    vim.keymap.set('n', '<leader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
      { desc = 'Debug: conditional breakpoint' })
    vim.keymap.set('n', '<leader>dc', start_or_continue, { desc = 'Debug: start or continue' })
    vim.keymap.set('n', '<leader>dt', debug_test, { desc = 'Debug: test' })
    vim.keymap.set('n', '<leader>dn', dap.step_over, { desc = 'Debug: step over' })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: step into' })
    vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Debug: step out' })
    vim.keymap.set('n', '<leader>dq', dap.terminate, { desc = 'Debug: stop' })
    vim.keymap.set('n', '<leader>dd', dapui.toggle, { desc = 'Debug: toggle UI' })
    vim.keymap.set({ 'n', 'v' }, '<leader>de', dapui.eval, { desc = 'Debug: evaluate' })
    vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Debug: console' })
  end,
}
