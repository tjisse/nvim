local cmp_ai = require('cmp_ai.config')

cmp_ai:setup({
  max_lines = 30,
  provider = "LlamaCpp",
  provider_options = {
    options = {
      n_predict = 256,  -- number of generated predictions
      min_p = 0.9, -- default 0.05,  Cut off predictions with probability below  Max_prob * min_p
      -- repeat_last_n = 64, -- default 64
      repeat_penalty = 1.0, -- default 1.1
    },
    prompt = function(lines_before, lines_after)
      -- return "<｜fim▁begin｜>" .. lines_before .. "<｜fim▁hole｜>" .. lines_after .. "<｜fim▁end｜>" -- for deepseek coder
      -- return "<fim_prefix>" .. lines_before .. "<fim_suffix>" .. lines_after .. "<fim_middle>" -- for codeqwen
      return "<|fim_prefix|>" .. lines_before .. "<|fim_suffix|>" .. lines_after .. "<|fim_middle|>" -- for codegemma
    end,
  },
  debounce_delay = 2500, -- ms llama may be GPU hungry, wait x ms after last key input, before sending request to it
  notify = true,
  notify_callback = function(msg)
    vim.notify(msg)
  end,
  run_on_every_keystroke = false,
  ignored_file_types = {
    -- Ignore telescope
    'TelescopePrompt',
    -- Ignore prompt
    'prompt',
  },
})
