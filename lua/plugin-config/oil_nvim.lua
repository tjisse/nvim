require('oil').setup({
  skip_confirm_for_simple_edits = true,
  keymaps = {
    ["<Esc>"] = "actions.close",
  },
  float = {
    max_width = 60,
    max_height = 20,
    win_options = {
      winblend = 0,
    },
  },
})
