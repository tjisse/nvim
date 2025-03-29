local function jumpWithVirtLineDiags(jumpCount)
  pcall(vim.api.nvim_del_augroup_by_name, "jumpWithVirtLineDiags")

  vim.diagnostic.jump({ count = jumpCount })

  local initialVirtTextConf = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { current_line = true },
  })

  vim.defer_fn(function()
    vim.api.nvim_create_autocmd("CursorMoved", {
      desc = "User(once): Reset diagnostics virtual lines",
      once = true,
      group = vim.api.nvim_create_augroup("jumpWithVirtLineDiags", {}),
      callback = function()
        vim.diagnostic.config({
          virtual_lines = false,
          virtual_text = initialVirtTextConf,
        })
      end,
    })
  end, 1)
end

return {
  'liangxianzhe/nap.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local nap = require('nap')
    nap.setup({
      next_repeat = ']]',
      prev_repeat = '[[',
    })
    nap.map('c', require('nap').gitsigns())
    nap.map('r', require("nap").illuminate())
    nap.map('d', {
      next = { rhs = function() jumpWithVirtLineDiags(1) end, opts = { desc = "Next diagnostic" } },
      prev = { rhs = function() jumpWithVirtLineDiags(-1) end, opts = { desc = "Last diagnostic" } },
      mode = { "n", "v", "o" },
    })
  end
}
