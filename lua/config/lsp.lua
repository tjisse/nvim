vim.opt.shortmess:append('c')

vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

local group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then return end
    local opts = { silent = true, buffer = event.buf }
    vim.keymap.set('n', '<c-p>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('i', '<c-p>', '<C-o>:lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', 'dq', vim.diagnostic.setqflist, opts)
    vim.keymap.set('n', 'dl', vim.diagnostic.setloclist, opts)
    vim.keymap.set({ 'n', 'x' }, '<M-CR>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('i', '<M-CR>', '<C-o>:lua vim.lsp.buf.code_action()<CR>', opts)
    vim.keymap.set('n', '<leader>rc', vim.lsp.codelens.run, vim.tbl_extend('force', opts, { desc = 'code lens' }))
    vim.keymap.set({ 'n', 'x' }, '<leader>rr', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'rename' }))
    vim.keymap.set({ 'n', 'x' }, '<leader>=', function()
      require('conform').format({ async = true, lsp_fallback = true })
    end, vim.tbl_extend('force', opts, { desc = 'format buffer/selection' }))
    if client:supports_method('textDocument/codeLens') then
      vim.lsp.codelens.enable(true, { bufnr = event.buf })
    end
  end,
})

vim.lsp.config('lua_ls', {
  root_dir = function(bufnr, on_dir)
    local workspace = require('lazydev').find_workspace(bufnr)
    local root = workspace or vim.fs.root(bufnr, {
      { '.emmyrc.json', '.luarc.json', '.luarc.jsonc' },
      { '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml' },
      { '.git' },
    }) or vim.fn.getcwd()
    on_dir(root)
  end,
})

vim.lsp.config('cucumber_language_server', {
  settings = {
    cucumber = {
      features = {
        'src/test/resources/features/**/*.feature',
        'itest/src/test/resources/features/**/*.feature',
        'features/**/*.feature',
        'cypress/e2e/**/*.feature',
      },
      glue = {
        'src/test/java/**/*.java',
        'itest/src/test/java/**/*.java',
        'features/**/*.ts',
        'features/**/*.js',
        'cypress/support/**/*.ts',
        'cypress/support/**/*.js',
      },
      parameterTypes = {},
    },
    features = {
      'src/test/resources/features/**/*.feature',
      'itest/src/test/resources/features/**/*.feature',
      'features/**/*.feature',
      'cypress/e2e/**/*.feature',
    },
    glue = {
      'src/test/java/**/*.java',
      'itest/src/test/java/**/*.java',
      'features/**/*.ts',
      'features/**/*.js',
      'cypress/support/**/*.ts',
      'cypress/support/**/*.js',
    },
    parameterTypes = {},
  },
})

vim.lsp.config('tailwindcss', {
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "clojure" },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          ":class\\s+\"([^\"]*)\"",
          ":[\\w-.#>]+\\.([\\w-]*)"
        },
      },
      includeLanguages = {
        clojure = "html"
      },
    },
  },
})

vim.lsp.config('sourcekit', {
  root_dir = function(bufnr, on_dir)
    local root_pattern = require('lspconfig.util').root_pattern
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local root = root_pattern('buildServer.json', '.bsp')(filename)
      or root_pattern('*.xcodeproj', '*.xcworkspace')(filename)
      or root_pattern('compile_commands.json', 'sdkconfig', 'Package.swift')(filename)
      or root_pattern('.git')(filename)
    if root then on_dir(root) end
  end,
  cmd = { 'sourcekit-lsp', '--experimental-feature', 'on-type-formatting' },
})


vim.lsp.enable({
  'angularls', 'bashls', 'clojure_lsp', 'cssls', 'html', 'jsonls', 'sqlls', 'lemminx', 'yamlls', 'lua_ls', 'tsc', 'cucumber_language_server', 'tailwindcss', 'fennel_language_server', 'fsautocomplete', 'sourcekit', 'clangd', 'janet_lsp',
})
