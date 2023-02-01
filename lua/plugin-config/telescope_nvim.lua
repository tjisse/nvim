local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local oil = require('oil')

local projects_path
if vim.fn.has('win32') then
  projects_path = 'D:/work/Projects'
else
  projects_path = '~/Projects'
end

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
    prompt_prefix = '  ',
    layout_config = {
      height = 0.5,
    },
    path_display = {
      truncate = true,
    },
  },
  pickers = {
    lsp_code_actions = {
      theme = 'cursor',
    }
  },
})

vim.keymap.set('n', '-', oil.open_float, { silent = true, desc = 'go to parent directory' })
vim.keymap.set('n', '<Space>fd', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end, { silent = true, desc = 'files in current directory' })
vim.keymap.set('n', '<Space>fr', ':Telescope oldfiles<CR>', { silent = true, desc = 'recent files' })
vim.keymap.set('n', '<Space>bb', builtin.buffers, { silent = true, desc = 'open buffers' })
vim.keymap.set('n', '<Space>ff', oil.open, { desc = 'open parent directory' })
vim.keymap.set('n', '<Space>fh', function() builtin.find_files({ cwd = '~', hidden = true }) end, { silent = true, desc = 'files in home directory' })
vim.keymap.set('n', '<Space>fp', function() builtin.find_files({ cwd = projects_path, hidden = true }) end, { silent = true, desc = 'files in project folder' })
vim.keymap.set('n', '<Space>gc', builtin.git_bcommits, { silent = true, desc = 'commits for current buffer' })
vim.keymap.set('n', '<Space>pf', builtin.find_files, { silent = true, desc = 'find file in project' })
vim.keymap.set('n', '<Space>pp', telescope.extensions.projects.projects, { silent = true, desc = 'find project' })
vim.keymap.set('n', '<Space>ps', builtin.live_grep, { silent = true, desc = 'search in project' })
vim.keymap.set('n', '<Space>wf', telescope.extensions.windows.list, { silent = true, desc = 'find window' })
