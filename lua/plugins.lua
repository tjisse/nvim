local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('rest-nvim').setup({ result = { split = { horizontal = true }}}) end
  },
  { 'Olical/aniseed', lazy = true },
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'janet', 'racket', 'hy', 'scheme', 'guile', 'commonlisp', 'julia', 'rust', 'lua', 'python' },
    config = function() require('plugin-config.conjure') end
  },
  { 'RaafatTurki/hex.nvim', event = 'VeryLazy', config = true },
  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
  },
  {
    'abecodes/tabout.nvim',
    event = { 'InsertEnter' },
    config = function() require('plugin-config.tabout_nvim') end,
  },
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter' },
    config = function() require('plugin-config.ultimate-autopair_nvim') end
  },
  {
    'ahmedkhalf/project.nvim',
    event = { 'VeryLazy' },
    config = function() require('plugin-config.project_nvim') end
  },
  {
    'brenton-leighton/multiple-cursors.nvim',
    version = '*',
    opts = {},
    keys = {
      { '<M-j>', '<Cmd>MultipleCursorsAddDown<CR>' },
      { '<M-S-j>', '<Cmd>MultipleCursorsAddJumpNextMatch<CR>' },
      { '<M-Down>', '<Cmd>MultipleCursorsAddDown<CR>', mode = { 'n', 'i' } },
      { '<M-k>', '<Cmd>MultipleCursorsAddUp<CR>' },
      { '<M-Up>', '<Cmd>MultipleCursorsAddUp<CR>', mode = { 'n', 'i' } },
      { '<M-LeftMouse>', '<Cmd>MultipleCursorsMouseAddDelete<CR>', mode = { 'n', 'i' } },
      { '<C-S-M-j>', '<Cmd>MultipleCursorsAddMatches<CR>', mode = { 'n', 'x' } },
      { '<C-S-M-j>', '<Cmd>MultipleCursorsAddMatchesV<CR>', mode = { 'v' } },
    },
  },
  {
    'chaoren/vim-wordmotion',
    event = { 'InsertEnter' },
    config = function() require('plugin-config.vim-wordmotion') end
  },
  {
    'chomosuke/term-edit.nvim',
    event = { 'TermOpen' },
    opts = { prompt_end = '%$ ' }
  },
  {
    "chrisgrieser/nvim-early-retirement",
    event = "VeryLazy",
    config = true,
  },
  {
    'danymat/neogen',
    event = { 'InsertEnter' },
    config = function() require('plugin-config.neogen') end,
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },
  {
    'declancm/cinnamon.nvim',
    version = '*',
    opts = {
      keymaps = {
        basic = true,
        extra = true,
      },
      options = { mode = 'window' },
    },
  },
  'dsych/blanket.nvim',
  {
    'echasnovski/mini.files',
    event = { 'VeryLazy' },
    config = function() require('plugin-config.mini_files') end
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    event = {
      'BufReadPre /home/tjisse/OneDrive/Apps/Remotely Secure/Notes/**.md',
      'BufNewFile /home/tjisse/OneDrive/Apps/Remotely Secure/Notes/**.md',
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      workspaces = {
        {
          name = 'Notes',
          path = '~/OneDrive/Apps/Remotely Secure/Notes',
        },
      },
    },
  },
  {
    'gbprod/yanky.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('plugin-config.yanky_nvim') end
  },
  {
    'gbprod/substitute.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('plugin-config.substitute_nvim') end
  },
  {
    'ggandor/flit.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'ggandor/leap.nvim', 'tpope/vim-repeat' },
    config = true,
  },
  {
    'ggandor/leap.nvim',
    lazy = true,
    config = function() require('leap').add_default_mappings() end
  },
  'farmergreg/vim-lastplace',
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function() require('plugin-config.which-key_nvim') end
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup({
        config = {
          header = {
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
          },
        },
      })
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  { 'hardikpthv/vscode-wc-snippets', ft = { 'javascript', 'typescript', 'html' } },
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function() require('plugin-config.nvim-cmp') end,
    dependencies = {
      { 'MattiasMTS/cmp-dbee', ft = 'sql' },
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      { 'hrsh7th/vim-vsnip', config = function() require('plugin-config.vim-vsnip') end },
      'hrsh7th/vim-vsnip-integ',
    },
    run = ':TSUpdate',
  },
  {
    'inkarkat/vim-ExtractMatches',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'inkarkat/vim-ingo-library' }
  },
  {
    'j-hui/fidget.nvim',
    event = 'VeryLazy',
    config = function() require('plugin-config.fidget_nvim') end
  },
  { 'kovisoft/paredit', config = function() require('plugin-config.paredit') end },
  {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup() end,
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'nvim-neotest/neotest',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neotest/nvim-nio',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-vim-test',
      'vim-test/vim-test'
    },
    config = function() require('plugin-config.nvim-neotest') end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('plugin-config.lualine_nvim') end,
  },
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'gbrlsnchs/telescope-lsp-handlers.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'kyoh86/telescope-windows.nvim',
      'mollerhoj/telescope-recent-files.nvim',
    },
    config = function() require('plugin-config.telescope_nvim') end,
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function() require('plugin-config.nvim-treesitter') end,
  },
  {
    'kevinhwang91/nvim-hlslens',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('scrollbar.handlers.search').setup() end,
  },
  {
    "kndndrj/nvim-dbee",
    cmd = 'Dbee',
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function() require("dbee").install() end,
    config = function() require("dbee").setup() end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    config = true
  },
  {
    'johmsalas/text-case.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true
  },
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function() require('nvim-surround').setup() end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugin-config.gitsigns_nvim') end,
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('lsp_lines').setup() end,
    dependencies = { 'neovim/nvim-lspconfig' },
  },
  {
    'mfussenegger/nvim-dap',
    cmd = 'DapContinue',
    config = function() require('plugin-config.nvim-dap') end,
    dependencies = {
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
      'jbyuki/one-small-step-for-vimkind'
    },
  },
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('plugin-config.nvim-lspconfig') end,
    dependencies = {
      'abecodes/tabout.nvim',
      'folke/neodev.nvim',
      'nvim-java/nvim-java',
      'williamboman/mason-lspconfig.nvim'
    },
  },
  {
    'nvim-java/nvim-java',
    lazy = true,
    config = function() require('java').setup() end,
  },
  'onsails/lspkind.nvim',
  {
    'petertriho/nvim-scrollbar',
    event = 'VeryLazy',
    config = function() require('scrollbar').setup() end,
  },
  {
    'qpkorr/vim-bufkill',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('plugin-config.vim-bufkill') end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function() require('plugin-config.lsp_signature_nvim') end
  },
  {
    'rgroli/other.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('plugin-config.other_nvim') end
  },
  {
    'rmagatti/auto-session',
    event = 'VeryLazy',
    config = function() require('plugin-config.auto-session') end,
  },
  {
    'rockyzhang24/arctic.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    priority = 1000,
    config = function() require('plugin-config.arctic') end,
  },
  {
    'rrethy/vim-illuminate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function () require('plugin-config.vim-illuminate') end,
  },
  {
    'rrethy/vim-hexokinase',
    ft = { 'css', 'sass', 'scss', 'html' },
    run = 'make hexokinase', config = function() require('plugin-config.vim-hexokinase') end,
  },
  {
    'scalameta/nvim-metals',
    ft = { 'scala', 'sbt' },
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap'
    },
    config = function() require('plugin-config.nvim-metals') end,
  },
  {
    'https://gitlab.com/schrieveslaach/sonarlint.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('plugin-config.sonarlint_nvim') end,
    dependencies = { 'neovim/nvim-lspconfig' },
  },
  { 'simnalamburt/vim-mundo', cmd = 'MundoToggle' },
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
  },
  { 'seudev/vscode-java-snippets', ft = 'java' },
  { 'stefandtw/quickfix-reflector.vim', event = 'VeryLazy' },
  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    config = function() require('plugin-config.conform_nvim') end
  },
  { 'stevearc/dressing.nvim', event = 'VeryLazy', config = true },
  {
    'stevearc/qf_helper.nvim',
    event = 'VeryLazy',
    config = true
  },
  { 'wesleyegberto/vscode-java-tests', ft = 'java' },
  { 'williamboman/mason.nvim', cmd = 'Mason' },
  { 'windwp/nvim-ts-autotag', config = true },
  { 'xabikos/vscode-jasmine', ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' } },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false,
    opts = {
      provider = 'copilot',
      auto_suggestions_provider = 'copilot',
      behaviour = {
        auto_suggestions = false,
      },
      copilot = {
        model = 'claude-3.5-sonnet',
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
      'stevearc/dressing.nvim',
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
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = { 'Copilot' },
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    }
  },
  { 'zbirenbaum/copilot-cmp', config = function() require('copilot_cmp').setup() end }
})
