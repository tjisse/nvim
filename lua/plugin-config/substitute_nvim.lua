local set_keymap = vim.keymap.set

require("substitute").setup({
  on_substitute = function(event)
    require("yanky").init_ring("p", event.register, event.count, event.vmode:match("[vV�]"))
  end,
})

set_keymap("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
set_keymap("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
set_keymap("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
set_keymap("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
