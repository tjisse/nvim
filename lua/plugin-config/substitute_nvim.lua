local substitute = require("substitute")

substitute.setup({
  on_substitute = require("yanky.integration").substitute(),
})

vim.keymap.set("n", "s", substitute.operator, { silent = true, noremap = true })
vim.keymap.set("n", "ss", substitute.line, { silent = true, noremap = true })
vim.keymap.set("n", "S", substitute.eol, { silent = true, noremap = true })
vim.keymap.set("x", "s", substitute.visual, { silent = true, noremap = true })
