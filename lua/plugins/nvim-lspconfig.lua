return {
  'neovim/nvim-lspconfig',
  cmd = 'LspInfo',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')

    local on_attach = function(client, bufnr)
      local opts = unpack({ silent = true, buffer = bufnr })
      vim.keymap.set('i', '<c-Space>', '<Esc><Plug>(completion_trigger)', { opts, noremap = true })
      vim.keymap.set('n', 'gD', vim.lsp.buf.implementation, { opts })
      vim.keymap.set('n', '<c-p>', vim.lsp.buf.signature_help, { opts })
      vim.keymap.set('i', '<c-p>', '<C-o>:lua vim.lsp.buf.signature_help()<CR>', { opts })
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { opts })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { opts })
      vim.keymap.set('n', 'gs', vim.lsp.buf.document_symbol, { opts })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { opts })
      vim.keymap.set('n', '1gd', vim.lsp.buf.declaration, { opts })
      vim.keymap.set('n', 'dq', vim.diagnostic.setqflist, { opts })
      vim.keymap.set('n', 'dl', vim.diagnostic.setloclist, { opts })
      vim.keymap.set('n', '<M-CR>', vim.lsp.buf.code_action, { opts })
      vim.keymap.set('n', '<leader>rc', vim.lsp.codelens.run, { opts, desc = 'code lens' })
      vim.keymap.set('i', '<M-CR>', '<C-o>:lua vim.lsp.buf.code_action()<CR>', { opts })
      vim.keymap.set('x', '<M-CR>', vim.lsp.buf.code_action, { opts })
      vim.keymap.set({ 'n', 'x' }, '<leader>=',
        function() require('conform').format({ async = true, lsp_fallback = true }) end,
        { opts, desc = 'format buffer/selection' })
      vim.keymap.set({ 'n', 'x' }, '<leader>rr', vim.lsp.buf.rename, { opts, desc = 'rename' })
      vim.keymap.set('', '<leader><leader>', require('lsp_lines').toggle, { desc = 'toggle diagnostics' })

      vim.lsp.codelens.refresh()
      if client.supports_method("textDocument/codeLens") then
        vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufEnter' }, {
          buffer = bufnr,
          callback = vim.lsp.codelens.refresh,
        })
      end
    end

    require('mason').setup()
    require('mason-lspconfig').setup({ automatic_installation = true })

    vim.opt.shortmess:append('c')

    local blink_lsp_capabilities = require('blink.cmp').get_lsp_capabilities()

    lspconfig.jdtls.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
      settings = {
        java = {
          signatureHelp = {
            enabled = true,
          },
          references = {
            includeAccessors = true,
            includeDecompiledSources = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
          symbols = {
            includeSourceMethodDeclarations = true,
          },
          inlayHints = {
            parameterNames = {
              enabled = 'all', -- literals, all, none
            },
          },
          completion = {
            postfix = {
              enable = true,
            },
            favoriteStaticMembers = {
              'org.hamcrest.MatcherAssert.assertThat',
              'org.hamcrest.Matchers.*',
              'org.hamcrest.CoreMatchers.*',
              'org.assertj.core.api.Assertions.*',
              'org.junit.jupiter.api.Assertions.*',
              'java.util.Objects.requireNonNull',
              'java.util.Objects.requireNonNullElse',
              'org.mockito.Mockito.*',
              'org.mockito.BDDMockito.*',
              'org.mockito.ArgumentMatchers.*',
              'org.mockito.Answers.*',
            },
            importOrder = {
              '',
              'javax',
              'java',
              '#',
            }
          },
          sources = {
            organizeImports = {
              starThreshold = 5,
              staticStarThreshold = 3,
            },
          },
        },
      },
    })

    lspconfig.angularls.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.bashls.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.clojure_lsp.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.cssls.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.html.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.jsonls.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.sqlls.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.html.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.jsonls.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.lemminx.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.yamlls.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.sqlls.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    require('neodev').setup({})
    lspconfig.lua_ls.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.ts_ls.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.cucumber_language_server.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
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

    lspconfig.tailwindcss.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
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

    lspconfig.fennel_language_server.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.fsautocomplete.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.sourcekit.setup({
      cmd = { 'sourcekit-lsp', '--experimental-feature', 'background-indexing' },
      root_dir = function(filename, _)
        return util.root_pattern 'buildServer.json' (filename)
            or util.root_pattern('*.xcodeproj', '*.xcworkspace')(filename)
            -- better to keep it at the end, because some modularized apps contain multiple Package.swift files
            or util.root_pattern('compile_commands.json', 'sdkconfig', 'Package.swift')(filename)
            or util.find_git_ancestor(filename)
      end,
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    lspconfig.clangd.setup({
      capabilities = blink_lsp_capabilities,
      on_attach = on_attach,
    })

    -- lspconfig.groovyls.setup({
    --   capabilities = cmp_nvim_lsp_capabilities,
    --   on_attach = on_attach,
    -- })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
      signs = true,
      update_in_insert = true,
    })

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    return { on_attach = on_attach }
  end,
  dependencies = {
    'abecodes/tabout.nvim',
    'folke/neodev.nvim',
    'nvim-java/nvim-java',
    'williamboman/mason-lspconfig.nvim'
  },
}
