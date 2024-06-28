require('plugins')
require('core')
require('mappings')

local lsp_ai_config = {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  single_file_support = false,
  cmd = { 'lsp-ai' },
  root_dir = '~/',
  init_options = {
    memory = {
      file_store = {}
    },
    models = {
      model1 = {
        type = "llama_cpp",
        repository = "bartowski/codegemma-7b-GGUF",
        name = "codegemma-7b-Q5_K_M.gguf",
        n_ctx = 2048,
        n_gpu_layers = 999
      }
    },
    completion = {
      model = "model1",
      parameters = {
        fim = {
          start = "<|fim_prefix|>",
          middle = "<|fim_suffix|>",
          ["end"] = "<|fim_middle|>"
        },
        max_context = 2000,
        max_new_tokens = 32
      }
    }
  },
}

vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {'clojure', 'fsharp'},
  callback = function() vim.lsp.start(lsp_ai_config) end,
})
