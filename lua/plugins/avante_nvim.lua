  return {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    opts = {
      provider = 'copilot',
      auto_suggestions_provider = 'copilot',
      behaviour = {
        auto_suggestions = false,
      },
      copilot = {
        model = 'claude-3.7-sonnet',
      },
      windows = {
        sidebar_header = {
          align = 'left',
        },
        ask = {
          focus_on_apply = 'theirs',
        },
      },
      vendors =  {
        openrouter = {
          endpoint = 'https://openrouter.ai/api/v1',
          api_key_name = 'cmd:rbw get openrouter-key',
          model = 'anthropic/claude-3.5-sonnet:beta',
          parse_curl_args = function(provider, code_opts)
            return {
              url = provider.endpoint .. '/chat/completions',
              headers = {
                ['Authorization'] = 'Bearer ' .. provider.parse_api_key(),
                ['Accept'] = 'application/json',
                ['Content-Type'] = 'application/json',
              },
              body = {
                model = provider.model,
                messages = require('avante.providers').openai.parse_message(code_opts),
                max_tokens = 4096,
                stream = true,
              },
            }
          end,
          parse_response_data = function(data_stream, _, opts)
           if data_stream:match('"%[DONE%]":') then
              opts.on_complete(nil)
              return
            end
            if data_stream:match('"delta":') then
              local json = vim.json.decode(data_stream)
              if json.choices and json.choices[1] then
                local choice = json.choices[1]
                if vim.tbl_contains({ "stop", "eos_token", "stop_sequence", "end_turn", "max_tokens" }, choice.finish_reason) then
                  opts.on_complete(nil)
                elseif choice.delta.content then
                  if choice.delta.content ~= vim.NIL then opts.on_chunk(choice.delta.content) end
                end
              end
            end
          end,
        },
      },
    },
    build = 'make',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
