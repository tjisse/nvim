return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require('which-key')

    wk.setup({
      delay = 250,
      replace = {
        ['<CR>'] = '↵',
        ['<Tab>'] = '⇆',
        ['<leader>'] = '⎵',
      }
    })

    wk.add({
      { '<leader><Tab>', ':b#<CR>',             desc = 'Switch to alternate buffer' },
      { '<leader>a',     group = 'Gemini', mode = { 'n', 'x' } },
      { '<leader>b',     group = 'buffer' },
      { '<leader>d',     group = 'debug' },
      { '<leader>f',     group = 'files' },
      { '<leader>g',     group = 'git' },
      { '<leader>h',     group = 'Git hunks and diffs', mode = { 'n', 'x' } },
      { '<leader>p',     group = 'project' },
      { '<leader>r',     group = 'refactor/run' },
      { '<leader>s',     group = 'search', mode = { 'n', 'x' } },
      { '<leader>t',     group = 'tabs' },
      { '<leader>u',     group = 'display and toggles' },
    })

    vim.opt.timeoutlen = 500
  end
}
