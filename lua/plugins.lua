local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'NTBBloodbath/rest.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('rest-nvim').setup() end,
  },
  'Olical/aniseed',
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'janet', 'racket', 'hy', 'scheme', 'guile', 'commonlisp', 'julia', 'rust', 'lua',
      'python' },
    config = function() require('plugin-config.conjure') end
  },
  'PeterRincker/vim-argumentative',
  { 'RaafatTurki/hex.nvim', config = function() require('hex').setup() end },
  {
    'abecodes/tabout.nvim',
    config = function() require('plugin-config.tabout_nvim') end,
    dependencies = { 'windwp/nvim-autopairs' },
  },
  { 'ahmedkhalf/project.nvim', config = function() require('plugin-config.project_nvim') end },
  { 'chaoren/vim-wordmotion', config = function() require('plugin-config.vim-wordmotion') end },
  { 'chomosuke/term-edit.nvim', tag = 'v1.1.0', config = function() require('term-edit').setup({ prompt_end = '%$ ' }) end },
  {
    "danymat/neogen",
    config = function() require('plugin-config.neogen') end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  { 'derekwyatt/vim-fswitch', config = function() require('plugin-config.vim-fswitch') end },
  'dsych/blanket.nvim',
  { 'gbprod/yanky.nvim', config = function() require('plugin-config.yanky_nvim') end },
  { 'gbprod/substitute.nvim', config = function() require('plugin-config.substitute_nvim') end },
  { 'gbrlsnchs/telescope-lsp-handlers.nvim', config = function() require('telescope').load_extension('lsp_handlers') end },
  { 'ggandor/flit.nvim', config = function() require('flit').setup() end },
  { 'ggandor/leap.nvim', config = function() require('leap').add_default_mappings() end },
  'farmergreg/vim-lastplace',
  { 'folke/which-key.nvim', config = function() require('plugin-config.which-key_nvim') end },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end
  },
  'hardikpthv/vscode-wc-snippets',
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
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
  'inkarkat/vim-ExtractMatches',
  'inkarkat/vim-ingo-library',
  { 'j-hui/fidget.nvim', config = function() require('fidget').setup() end },
  {
    'nvim-neotest/neotest',
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
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('plugin-config.lualine_nvim') end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugin-config.telescope_nvim') end,
  },
  { 'nvim-telescope/telescope-fzy-native.nvim', config = function() require('telescope').load_extension('fzy_native') end },
  { 'nvim-telescope/telescope-ui-select.nvim', config = function() require('telescope').load_extension('ui-select') end },
  'kevinhwang91/nvim-hlslens',
  { 'kovisoft/paredit', config = function() require('plugin-config.paredit') end },
  {
    'kristijanhusak/vim-dadbod-ui',
    cmd = { 'DBUI', 'DBUIToggle' },
    dependencies = {
      { 'tpope/vim-dadbod', config = function() require('plugin-config.vim-dadbod') end },
    },
  },
  {
    'nvim-tree/nvim-web-devicons',
    config = function() require('nvim-web-devicons') end,
    dependencies = { 'Mofiqul/vscode.nvim' },
  },
  {
    'jcdickinson/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function() require('codeium').setup({}) end
  },
  { 'johmsalas/text-case.nvim', config = function() require('textcase').setup({}) end },
  { 'kyoh86/telescope-windows.nvim', config = function() require('telescope').load_extension('windows') end },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugin-config.gitsigns_nvim') end,
  },
  {
    "Maan2003/lsp_lines.nvim",
    config = function() require("lsp_lines").setup() end,
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
  'mfussenegger/nvim-jdtls',
  {
    'neovim/nvim-lspconfig',
    config = function() require('plugin-config.nvim-lspconfig') end,
    dependencies = {
      'abecodes/tabout.nvim',
      'folke/neodev.nvim',
      'williamboman/mason-lspconfig.nvim'
    },
  },
  'onsails/lspkind.nvim',
  { 'petertriho/nvim-scrollbar', config = function() require('plugin-config.nvim-scrollbar') end },
  { 'qpkorr/vim-bufkill', config = function() require('plugin-config.vim-bufkill') end },
  'radenling/vim-dispatch-neovim',
  { 'rbong/vim-flog', cmd = { 'Flog', 'Flogsplit' }, dependencies = { 'tpope/vim-fugitive' } },
  { 'rmagatti/auto-session', config = function() require('plugin-config.auto-session') end },
  {
    'rockyzhang24/arctic.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    lazy = false,
    priority = 1000,
    config = function() require('plugin-config.arctic') end
  },
  { 'rrethy/vim-illuminate', config = function () require('plugin-config.vim-illuminate') end },
  { 'rrethy/vim-hexokinase', run = 'make hexokinase', config = function() require('plugin-config.vim-hexokinase') end },
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
  { 'https://gitlab.com/schrieveslaach/sonarlint.nvim', config = function() require('plugin-config.sonarlint_nvim') end },
  { 'simnalamburt/vim-mundo', cmd = 'MundoToggle' },
  'seudev/vscode-java-snippets',
  'stefandtw/quickfix-reflector.vim',
  { 'stevearc/oil.nvim', config = function() require('plugin-config.oil_nvim') end },
  { 'stevearc/qf_helper.nvim', config = function() require('qf_helper').setup() end },
  'stevearc/dressing.nvim',
  {
    'theHamsta/crazy-node-movement',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', 'nvim-treesitter/nvim-treesitter' },
    config = function() require('plugin-config.nvim-treesitter') end,
  },
  'tommcdo/vim-fubitive',
  'tpope/vim-commentary',
  'tpope/vim-dispatch',
  { 'tpope/vim-fugitive', cmd = "Git" },
  'tpope/vim-eunuch',
  'tpope/vim-repeat',
  'tpope/vim-sleuth',
  'tpope/vim-surround',
  'wesleyegberto/vscode-java-tests',
  { 'whiteinge/diffconflicts', cmd = { 'DiffConflicts', 'DiffConflictsWithHistory' } },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  { 'windwp/nvim-autopairs', config = function() require('plugin-config.nvim-autopairs') end },
  'windwp/nvim-ts-autotag',
  'xabikos/vscode-jasmine',
})
