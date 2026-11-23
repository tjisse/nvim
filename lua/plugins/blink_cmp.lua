local function show_words(cmp)
  return cmp.show({ providers = { 'buffer' } })
end

return {
  'saghen/blink.cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    'rafamadriz/friendly-snippets',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end
    },
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
        direction_priority = { 'n', 's' },
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
      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<C-p>'] = { 'select_prev', show_words, 'fallback' },
      ['<C-n>'] = { 'select_next', show_words, 'fallback' },
    },
    signature = {
      enabled = true,
    },
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
          enabled = function() return vim.bo.filetype == 'lua' end,
        },
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 10,
          async = true,
        },
        snippets = {
          name = 'snippets',
          score_offset = 10,
        },
      },
    },
  },
}
