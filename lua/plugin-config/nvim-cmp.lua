local cmp = require('cmp')
local lspkind = require('lspkind')

vim.opt.completeopt = 'menu,menuone,noinsert'
vim.opt.pumheight = 15

local function ai_top_comparator(entry1, entry2)
  local comp_item = entry1:get_completion_item()
  if comp_item ~= nil then
    if string.sub(comp_item.label, 1, 4) == "ai -" then
      return true
    end
  end
  comp_item = entry2:get_completion_item()
  if comp_item ~= nil then
    if string.sub(comp_item.label, 1, 4) == "ai -" then
      return false
    end
  end
  return nil
end

local default_sorting = require('cmp.config.default')().sorting
local my_sorting = vim.tbl_extend("force", {}, default_sorting)
table.insert(my_sorting.comparators, 1, ai_top_comparator)

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
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<Up>'] = cmp.mapping.select_prev_item(),
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
    { name = 'nvim_lsp', priority = 10 },
    { name = 'vsnip', max_item_count = 5 },
    { name = 'buffer', max_item_count = 5, keyword_length = 3 },
    { name = 'path' },
    { name = "cmp-dbee" },
  },
  sorting = my_sorting,
  formatting = {
    format = function(entry, vim_item)
      return lspkind.cmp_format({
        maxwidth = 30,
        ellipsis_char = '...',
      })(entry, vim_item)
    end,
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
