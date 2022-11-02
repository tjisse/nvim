local cmp = require('cmp')
local compare = require('cmp.config.compare')
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
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lsp', max_item_count = 10, priority = 2 },
    { name = 'vsnip', max_item_count = 5 },
    { name = 'buffer', max_item_count = 5, keyword_length = 3 },
    { name = 'path', max_item_count = 5 },
  },
  sorting = {
    priority_weight = 1.0,
    comparators = {
      -- compare.score_offset,
      compare.locality,
      compare.recently_used,
      compare.score,
      compare.offset,
      compare.order,
      -- compare.scopes,
      -- compare.sort_text,
      -- compare.exact,
      -- compare.kind,
      -- compare.length,
    }
  },
  formatting = {
    format = function(entry, vim_item)
      return lspkind.cmp_format({
        maxwidth = 30,
        ellipsis_char = '...',
      })(entry, vim_item)
    end
  },
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
  },
  experimental = {
    ghost_text = true,
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
