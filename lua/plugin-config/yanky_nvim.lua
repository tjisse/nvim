local set_keymap = vim.api.nvim_set_keymap

require("yanky").setup()

set_keymap("n", "p", "<Plug>(YankyPutAfter)", {})
set_keymap("n", "P", "<Plug>(YankyPutBefore)", {})
set_keymap("x", "p", "<Plug>(YankyPutAfter)", {})
set_keymap("x", "P", "<Plug>(YankyPutBefore)", {})
set_keymap("n", "gp", "<Plug>(YankyGPutAfter)", {})
set_keymap("n", "gP", "<Plug>(YankyGPutBefore)", {})
set_keymap("x", "gp", "<Plug>(YankyGPutAfter)", {})
set_keymap("x", "gP", "<Plug>(YankyGPutBefore)", {})
set_keymap("n", "<c-n>", "<Plug>(YankyCycleForward)", {})
set_keymap("n", "<c-p>", "<Plug>(YankyCycleBackward)", {})
