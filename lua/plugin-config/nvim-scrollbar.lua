local colors = require('vscode.colors')
require("scrollbar.handlers.search").setup()
require('scrollbar').setup({
  handle = { color = colors.vscPopupHighlightGray }
})

