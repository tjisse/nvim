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
    'NTBBloodbath/rest.nvim',
    ft = 'http',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true
  },
  { 'Olical/aniseed', lazy = true },
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'janet', 'racket', 'hy', 'scheme', 'guile', 'commonlisp', 'julia', 'rust', 'lua', 'python' },
    config = function() require('plugin-config.conjure') end
  },
  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true
  },
  { 'RaafatTurki/hex.nvim', event = 'VeryLazy', config = true },
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
    'danymat/neogen',
    event = { 'InsertEnter' },
    config = function() require('plugin-config.neogen') end,
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },
  {
    'derekwyatt/vim-fswitch',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('plugin-config.vim-fswitch') end
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
    dependencies = { 'ggandor/leap.nvim', 'tpope/vim-repeat' }
  },
  {
    'ggandor/leap.nvim',
    lazy = true,
    config = function() require('leap').add_default_mappings() end
  },
  {
    'grierson/formedit',
    ft = { 'clojure', 'fennel', 'janet', 'racket', 'hy', 'scheme', 'guile', 'commonlisp' },
    config = function() require('plugin-config.formedit') end,
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
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'kristijanhusak/vim-dadbod-completion',
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
  {
    'nvim-neotest/neotest',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-lua/plenary.nvim',
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
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'kyoh86/telescope-windows.nvim'
    },
    config = function() require('plugin-config.telescope_nvim') end,
  },
  { 'kevinhwang91/nvim-hlslens', event = { 'BufReadPre', 'BufNewFile' } },
  {
    'kristijanhusak/vim-dadbod-ui',
    cmd = { 'DBUI', 'DBUIToggle' },
    dependencies = {
      { 'tpope/vim-dadbod', config = function() require('plugin-config.vim-dadbod') end },
    },
  },
  { 'numToStr/Comment.nvim', config = true },
  {
    'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    config = true
  },
  {
    'jcdickinson/codeium.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
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
    'Maan2003/lsp_lines.nvim',
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
  { 'mfussenegger/nvim-jdtls', lazy = true },
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('plugin-config.nvim-lspconfig') end,
    dependencies = {
      'abecodes/tabout.nvim',
      'folke/neodev.nvim',
      'williamboman/mason-lspconfig.nvim'
    },
  },
  'onsails/lspkind.nvim',
  {
    'petertriho/nvim-scrollbar',
    event = 'VeryLazy',
    config = function() require('plugin-config.nvim-scrollbar') end
  },
  {
    'qpkorr/vim-bufkill',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('plugin-config.vim-bufkill') end
  },
  {
    'rmagatti/auto-session',
    event = 'VeryLazy',
    config = function() require('plugin-config.auto-session') end
  },
  {
    'rockyzhang24/arctic.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    priority = 1000,
    config = function() require('plugin-config.arctic') end
  },
  {
    'rrethy/vim-illuminate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function () require('plugin-config.vim-illuminate') end
  },
  {
    'rrethy/vim-hexokinase',
    ft = { 'css', 'sass', 'scss', 'html' },
    run = 'make hexokinase', config = function() require('plugin-config.vim-hexokinase') end
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
  {
    'theHamsta/crazy-node-movement',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', 'nvim-treesitter/nvim-treesitter' },
    config = function() require('plugin-config.nvim-treesitter') end,
  },
  { 'tpope/vim-sleuth', event = { 'BufReadPre', 'BufNewFile' } },
  { 'wesleyegberto/vscode-java-tests', ft = 'java' },
  { 'williamboman/mason.nvim', cmd = 'Mason' },
  { 'windwp/nvim-ts-autotag', event = { 'InsertEnter' } },
  { 'xabikos/vscode-jasmine', ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' } },
})
