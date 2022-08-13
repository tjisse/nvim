local cmp = require('cmp')
local lspkind = require('lspkind')

vim.opt.completeopt = 'menu,menuone,noinsert'

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
      elseif vim.fn['vsnip#available'](1) ~= 0 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '')
      else
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(Tabout)', true, true, true), '')
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#available'](1) ~= 0 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-jump-prev)', true, true, true), '')
      else
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(Tabout)', true, true, true), '')
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'vsnip' },
    -- { name = 'copilot' },
    { name = 'buffer' },
    { name = 'path' },
  },
  formatting = {
    format = function(entry, vim_item)
      if entry.source.name == 'copilot' then
        vim_item.kind = ' Copilot'
        vim_item.kind_hl_group = 'CmpItemKindCopilot'
        return vim_item
      end
      return lspkind.cmp_format()(entry, vim_item)
    end
  },
})

local cmdline_mapping = {
  ['<C-j>'] = {
    c = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
  },
  ['<C-k>'] = {
    c = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  ['<C-Space>'] = {
    c = cmp.mapping.complete()
  },
  ['<Tab>'] = {
    c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace })
  },
}

cmp.setup.cmdline(':', {
  mapping = cmdline_mapping,
  sources = {
    { name = 'cmdline' },
    { name = 'path' },
    { name = 'buffer' },
  }
})

cmp.setup.cmdline('/', {
  mapping = cmdline_mapping,
  sources = {
    { name = 'buffer' },
  }
})

vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })
