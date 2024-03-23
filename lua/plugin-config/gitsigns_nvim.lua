require('gitsigns').setup({
  _signs_staged_enable = true,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<Space>hs', gs.stage_hunk, { desc = 'Stage hunk' })
    map('n', '<Space>hr', gs.reset_hunk, { desc = 'Reset hunk' })
    map('v', '<Space>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Stage hunk' })
    map('v', '<Space>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Reset hunk' })
    map('n', '<Space>hS', gs.stage_buffer, { desc = 'Stage buffer' })
    map('n', '<Space>hu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
    map('n', '<Space>hR', gs.reset_buffer, { desc = 'Reset buffer' })
    map('n', '<Space>hp', gs.preview_hunk, { desc = 'Preview hunk' })
    map('n', '<Space>hb', function() gs.blame_line{ full=true } end, { desc = 'Blame line' })
    map('n', '<Space>tb', gs.toggle_current_line_blame, { desc = 'Toggle line blame' })
    map('n', '<Space>hd', gs.diffthis, { desc = 'Diff this' })
    map('n', '<Space>hD', function() gs.diffthis('~') end, { desc = 'Diff this ~' })
    map('n', '<Space>td', gs.toggle_deleted, { desc = 'Toggle deleted' })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})
require('scrollbar.handlers.gitsigns').setup()
