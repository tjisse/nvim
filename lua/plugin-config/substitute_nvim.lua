require("substitute").setup({
  on_substitute = function(event)
    require("yanky").init_ring("p", event.register, event.count, event.vmode:match("[vV�]"))
  end,
})

local map = vim.api.nvim_set_keymap

map("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
map("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
map("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
map("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })

