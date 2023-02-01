require('gitsigns').setup({
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
    map({ 'n', 'v' }, '<Space>hs', ':Gitsigns stage_hunk<CR>')
    map({ 'n', 'v' }, '<Space>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<Space>hS', gs.stage_buffer)
    map('n', '<Space>hu', gs.undo_stage_hunk)
    map('n', '<Space>hR', gs.reset_buffer)
    map('n', '<Space>hp', gs.preview_hunk)
    map('n', '<Space>hb', function() gs.blame_line{ full = true } end)
    map('n', '<Space>tb', gs.toggle_current_line_blame)
    map('n', '<Space>hd', gs.diffthis)
    map('n', '<Space>hD', function() gs.diffthis('~') end)
    map('n', '<Space>td', gs.toggle_deleted)

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})
