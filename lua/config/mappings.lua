vim.keymap.set('n', '<leader>fs', '<Cmd>w<CR>', { desc = 'save file' })

vim.keymap.set('n', '<leader>pd', vim.diagnostic.setqflist, { desc = 'Open diagnostics from all buffers in quickfix' })
vim.keymap.set('n', '<leader>bd', vim.diagnostic.setloclist, { desc = 'Open buffer diagnostics in location list' })

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'qf' },
    callback = function()
        vim.keymap.set('n', 'q', '<Cmd>close<CR>', { buffer = true })
    end,
})

vim.keymap.set('n', 'g]', ']d', { remap = true, desc = 'Next diagnostic' })
vim.keymap.set('n', 'g[', '[d', { remap = true, desc = 'Previous diagnostic' })

-- Move the current line or visual range, keeping the active selection.
for key, direction in pairs({ ['[e'] = -1, [']e'] = 1 }) do
  vim.keymap.set({ 'n', 'x' }, key, function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local visual = vim.fn.mode() ~= 'n'
    local anchor = visual and vim.fn.line('v') or row
    local first, last = math.min(row, anchor), math.max(row, anchor)
    local delta = math.max(1 - first, math.min(direction * vim.v.count1, vim.fn.line('$') - last))
    if delta == 0 then return end
    local destination = delta > 0 and last + delta or first + delta - 1
    if visual then vim.cmd.normal({ vim.keycode('<Esc>'), bang = true }) end
    vim.cmd(('%d,%dmove %d'):format(first, last, destination))
    if visual then vim.cmd.normal({ 'gv', bang = true }) end
    vim.api.nvim_win_set_cursor(0, { row + delta, col })
  end, { desc = direction < 0 and 'Move lines up' or 'Move lines down' })
end

-- Visual shifting (does not exit Visual mode)
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

-- Terminal window management
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Tab management
vim.keymap.set('n', '<leader>td', '<Cmd>tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>tt', '<Cmd>$tabnew<CR>', { desc = 'new tab' })

for i = 1, 9, 1 do
  vim.keymap.set('n', '<leader>' .. i, '<Cmd>' .. i .. 'tabnext<CR>', { desc = 'Go to tab ' .. i })
  vim.keymap.set('n', '<leader>t' .. i, '<Cmd>' .. i - 1 .. 'tabmove<CR>', { desc = 'move tab to ' .. i })
end

vim.keymap.set('n', '<leader>sc', '<Cmd>nohlsearch<CR>', { desc = 'clear search highlight' })

vim.keymap.set('n', '<leader>\'', '<Cmd>terminal<CR>', { desc = 'open terminal' })

vim.keymap.set('n', '<leader>q', '<Cmd>quitall<CR>', { desc = 'Quit all windows' })
vim.keymap.set('n', '<leader>Q', '<Cmd>quitall!<CR>', { desc = 'Quit all windows without saving' })
vim.keymap.set('n', '<leader>U', '<Cmd>MundoToggle<CR>', { desc = 'undo tree' })
vim.keymap.set('n', '<leader>gg', '<Cmd>Neogit kind=auto<CR>', { desc = 'Open Git status in Neogit' })
