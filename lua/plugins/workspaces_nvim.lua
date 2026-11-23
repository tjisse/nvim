return {
  'natecraddock/workspaces.nvim',
  keys = {
    { '<leader>pp', function()
      vim.ui.select(require('workspaces').get(), {
        prompt = 'Open project',
        format_item = function(item) return item.name .. '  ' .. item.path end,
      }, function(item)
        if item then require('workspaces').open(item.name) end
      end)
    end, desc = 'Open project' },
  },
  lazy = false,
  config = function()
    local project = require('config.project')
    require('workspaces').setup({
      hooks = { open_pre = function(name, path)
        project.open(name, path)
        return false -- The project tab owns its working directory.
      end },
    })
    vim.api.nvim_create_autocmd('TabClosedPre', { callback = function()
      project.save()
      vim.t.project_session = nil
    end })
    vim.api.nvim_create_autocmd('VimLeavePre', { callback = project.save })
  end,
}
