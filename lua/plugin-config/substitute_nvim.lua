local substitute = require("substitute")

substitute.setup({
  on_substitute = function(event)
    require("yanky").init_ring("p", event.register, event.count, event.vmode:match("[vV�]"))
  end,
})

vim.keymap.set("n", "s", substitute.operator, { silent = true, noremap = true })
vim.keymap.set("n", "ss", substitute.line, { silent = true, noremap = true })
vim.keymap.set("n", "S", substitute.eol, { silent = true, noremap = true })
vim.keymap.set("x", "s", substitute.visual, { silent = true, noremap = true })
