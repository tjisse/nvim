return {
  'brenton-leighton/multiple-cursors.nvim',
  version = '*',
  opts = {},
  keys = {
    { '<M-j>',         '<Cmd>MultipleCursorsAddDown<CR>' },
    { 'gl',            '<Cmd>MultipleCursorsAddJumpNextMatch<CR>', mode = { 'n', 'x' }, desc = 'Add next match' },
    { 'gL',            '<Cmd>MultipleCursorsAddJumpPrevMatch<CR>', mode = { 'n', 'x' }, desc = 'Add previous match' },
    { '<M-Down>',      '<Cmd>MultipleCursorsAddDown<CR>',         mode = { 'n', 'i' } },
    { '<M-k>',         '<Cmd>MultipleCursorsAddUp<CR>' },
    { '<M-Up>',        '<Cmd>MultipleCursorsAddUp<CR>',           mode = { 'n', 'i' } },
    { '<M-LeftMouse>', '<Cmd>MultipleCursorsMouseAddDelete<CR>',  mode = { 'n', 'i' } },
    { '<C-S-M-j>',     '<Cmd>MultipleCursorsAddMatches<CR>',      mode = 'n' },
    { '<C-S-M-j>',     '<Cmd>MultipleCursorsAddMatchesV<CR>',     mode = 'x' },
  },
}
