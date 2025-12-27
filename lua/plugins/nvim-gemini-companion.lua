return {
  "gutsavgupta/nvim-gemini-companion",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    require("gemini").setup()
  end,
  keys = {
    { "<leader>at", "<cmd>GeminiToggle<cr>",      desc = "Toggle Gemini sidebar" },
    { "<leader>aa", "<cmd>GeminiSwitchToCli<cr>", desc = "Spawn or switch to AI session" },
    { '<leader>gS', '<cmd>GeminiSend<cr>',        mode = { 'x' },                        desc = 'Send selection to Gemini' },

  }
}
