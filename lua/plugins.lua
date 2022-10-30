require('packer').startup(function(use)
  use { 'Mofiqul/vscode.nvim', config = function() require('plugin-config.vscode_nvim') end }
  use {
    'NTBBloodbath/rest.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('rest-nvim').setup() end,
  }
  use 'Olical/aniseed'
  use { 'Olical/conjure', config = function() require('plugin-config.conjure') end }
  use 'PeterRincker/vim-argumentative'
  use {
    'abecodes/tabout.nvim',
    config = function() require('plugin-config.tabout_nvim') end,
    wants = { 'nvim-treesitter' },
    after = { 'nvim-autopairs' }
  }
  use { 'ahmedkhalf/project.nvim', config = function() require('plugin-config.project_nvim') end }
  use 'chaoren/vim-wordmotion'
  use { 'derekwyatt/vim-fswitch', config = function() require('plugin-config.vim-fswitch') end }
  use { 'gbprod/yanky.nvim', config = function() require('plugin-config.yanky_nvim') end }
  use { 'gbprod/substitute.nvim', config = function() require('plugin-config.substitute_nvim') end }
  use { 'gbrlsnchs/telescope-lsp-handlers.nvim', config = function() require('telescope').load_extension('lsp_handlers') end }
  use { 'ggandor/leap.nvim', config = function() require('leap').add_default_mappings() end }
  use { 'editorconfig/editorconfig-vim', config = function() require('plugin-config.editorconfig-vim') end }
  use 'farmergreg/vim-lastplace'
  use 'folke/neodev.nvim'
  use { 'folke/which-key.nvim', config = function() require('plugin-config.which-key_nvim') end }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }
  use 'hardikpthv/vscode-wc-snippets'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use { 'hrsh7th/nvim-cmp', config = function() require('plugin-config.nvim-cmp') end, run = ':TSUpdate' }
  use 'hrsh7th/cmp-vsnip'
  use { 'hrsh7th/vim-vsnip', config = function() require('plugin-config.vim-vsnip') end }
  use 'hrsh7th/vim-vsnip-integ'
  use 'idanarye/vim-merginal'
  use 'inkarkat/vim-ExtractMatches'
  use 'inkarkat/vim-ingo-library'
  use { 'kkoomen/vim-doge', config = function() require('plugin-config.vim-doge') end, run = 'doge#install()' }
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-vim-test',
      'vim-test/vim-test'
    },
    config = function() require('plugin-config.nvim-neotest') end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('plugin-config.lualine_nvim') end,
    after = { 'vscode.nvim' },
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugin-config.telescope_nvim') end,
  }
  use { 'nvim-telescope/telescope-file-browser.nvim', config = function() require('telescope').load_extension('file_browser') end }
  use { 'nvim-telescope/telescope-fzy-native.nvim', config = function() require('telescope').load_extension('fzy_native') end }
  use { 'nvim-telescope/telescope-ui-select.nvim', config = function() require('telescope').load_extension('ui-select') end }
  use 'kevinhwang91/nvim-hlslens'
  use { 'kovisoft/paredit', config = function() require('plugin-config.paredit') end }
  use 'kristijanhusak/vim-dadbod-completion'
  use 'kristijanhusak/vim-dadbod-ui'
  use {
    'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-web-devicons') end,
    after = { 'vscode.nvim' },
  }
  use { 'kyoh86/telescope-windows.nvim', config = function() require('telescope').load_extension('windows') end }
  use { 'liuchengxu/vim-better-default', config = function() require('plugin-config.vim-better-default') end }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end,
  }
  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function() require("lsp_lines").setup() end,
    after = 'nvim-lspconfig',
  }
  use { 'luukvbaal/stabilize.nvim', config = function() require('stabilize').setup() end }
  use {
    'mfussenegger/nvim-dap',
    config = function() require('plugin-config.nvim-dap') end,
    requires = {
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
      'jbyuki/one-small-step-for-vimkind'
    }
  }
  use 'mfussenegger/nvim-jdtls'
  use { 'mfussenegger/nvim-lint', config = function() require('plugin-config.nvim-lint') end }
  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugin-config.nvim-lspconfig') end,
    after = { 'tabout.nvim', 'mason-lspconfig.nvim' },
  }
  use { 'nvim-treesitter/nvim-treesitter', config = function() require('plugin-config.nvim-treesitter') end }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'onsails/lspkind.nvim'
  use { 'petertriho/nvim-scrollbar', config = function() require('plugin-config.nvim-scrollbar') end }
  use 'psliwka/vim-smoothie'
  use { 'qpkorr/vim-bufkill', config = function() require('plugin-config.vim-bufkill') end }
  use 'radenling/vim-dispatch-neovim'
  use { 'rmagatti/auto-session', config = function() require('plugin-config.auto-session') end }
  use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }
  use {
    'scalameta/nvim-metals',
    requires = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
    config = function() require('plugin-config.nvim-metals') end,
    after = { 'nvim-lspconfig' }
  }
  use 'simnalamburt/vim-mundo'
  use 'seudev/vscode-java-snippets'
  use 'stefandtw/quickfix-reflector.vim'
  use { 'stevearc/qf_helper.nvim', config = function() require('qf_helper').setup() end }
  use 'tpope/vim-commentary'
  use { 'tpope/vim-dadbod', config = function() require('plugin-config/vim-dadbod') end }
  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'
  use { 'tpope/vim-fugitive', config = function() require('plugin-config.vim-fugitive') end }
  use 'tpope/vim-repeat'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-surround'
  use 'wbthomason/packer.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use { 'windwp/nvim-autopairs', config = function() require('plugin-config.nvim-autopairs') end }
  use 'windwp/nvim-ts-autotag'
end)

local packerUserConfig = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { pattern = 'plugins.lua', command = 'source <afile> | PackerCompile', group = packerUserConfig })
