local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local mini_files = require('mini.files')

telescope.load_extension('lsp_handlers')
telescope.load_extension('fzy_native')
telescope.load_extension('ui-select')
telescope.load_extension('windows')
telescope.load_extension('recent-files')

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
    prompt_prefix = '   ',
    layout_config = {
      height = 0.5,
    },
    path_display = {
      filename_first = true,
    },
    file_ignore_patterns = {
      ".git/",
      ".cpcache/",
      ".clj%-kondo/",
      ".lsp/",
      "node_modules/",
      "target/",
      "package%-lock.json",
    },
  },
  pickers = {
    lsp_code_actions = {
      theme = 'cursor',
    },
    buffers = {
      initial_mode = 'normal',
      ignore_current_buffer = true,
      sort_mru = true,
    },
  },
})

vim.keymap.set('n', '-', function() mini_files.open(vim.api.nvim_buf_get_name(0)) end, { silent = true, desc = 'open directory of current file' })
vim.keymap.set('n', '<Space>fd', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end, { silent = true, desc = 'files in current directory' })
vim.keymap.set('n', '<Space>fr', ':Telescope oldfiles<CR>', { silent = true, desc = 'recent files' })
vim.keymap.set('n', '<Space>bb', builtin.buffers, { silent = true, desc = 'open buffers' })
vim.keymap.set('n', '<Space>ff', mini_files.open, { desc = 'open parent directory' })
vim.keymap.set('n', '<Space>fh', function() builtin.find_files({ cwd = '~', hidden = true }) end, { silent = true, desc = 'files in home directory' })
vim.keymap.set('n', '<Space>fp', function() builtin.find_files({ cwd = projects_path, hidden = true }) end, { silent = true, desc = 'files in project folder' })
vim.keymap.set('n', '<Space>gc', builtin.git_bcommits, { silent = true, desc = 'commits for current buffer' })
vim.keymap.set('n', '<Space>pd', builtin.diagnostics, { silent = true, desc = 'show diagnostics in project' })
vim.keymap.set('n', '<Space>pf', function() telescope.extensions['recent-files'].recent_files({ hidden = true, include_current_file = false }) end, { silent = true, desc = 'find file in project' })
vim.keymap.set('n', '<Space>pp', telescope.extensions.projects.projects, { silent = true, desc = 'find project' })
vim.keymap.set('n', '<Space>pl', builtin.lsp_dynamic_workspace_symbols, { silent = true, desc = 'search lsp symbol in project' })
vim.keymap.set('n', '<Space>ps', builtin.live_grep, { silent = true, desc = 'search in project' })
vim.keymap.set('n', '<Space>pS', builtin.grep_string, { silent = true, desc = 'search word under cursor in project' })
vim.keymap.set('n', '<Space>wf', telescope.extensions.windows.list, { silent = true, desc = 'find window' })
