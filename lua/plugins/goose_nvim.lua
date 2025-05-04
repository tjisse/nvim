return {
  'azorng/goose.nvim',
  branch = 'main',
  config = function()
    require('goose').setup({
      keymap = {
        global = {
          toggle = '<leader>aa',
        }
      }
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown" },
      opts = {
        anti_conceal = { enabled = false },
      },
    }
  },
}
