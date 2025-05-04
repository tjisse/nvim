return {
  'saghen/blink.cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    'rafamadriz/friendly-snippets',
    'fang2hou/blink-copilot'
  },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    cmdline = {
      keymap = {
        ['<C-Space>'] = { 'show', 'hide', 'fallback' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<CR>'] = { 'accept_and_enter', 'fallback' },
        ['<Tab>'] = { 'accept', 'fallback' },
      },
      completion = {
        menu = { auto_show = true },
      },
    },
    completion = {
      ghost_text = {
        enabled = true,
        show_with_menu = true,
      },
      menu = {
        draw = {
          components = {
            label = {
              width = {
                fill = true,
                max = 30,
              },
            },
          },
          treesitter = { 'lsp' },
        },
      },
    },
    keymap = {
      preset = 'none',
      ['<C-Space>'] = { 'show', 'hide' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.snippet_forward()
          elseif cmp.is_visible() then
            return cmp.select_and_accept()
          else
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(Tabout)', true, true, true), '')
          end
        end,
      },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['K'] = { 'show_documentation', 'hide_documentation', 'fallback' },
      ['<C-p>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    signature = {
      enabled = true,
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
      providers = {
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 100,
          async = true,
        },
      },
    },
  },
}
