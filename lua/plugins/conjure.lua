return {
  'Olical/conjure',
  ft = { 'clojure', 'fennel', 'janet', 'racket', 'hy', 'scheme', 'guile', 'commonlisp', 'julia', 'rust', 'lua', 'python' },
  config = function()
    vim.g['conjure#completion#omnifunc'] = ''
    vim.g['conjure#mapping#doc_word'] = false
    vim.g['conjure#extract#tree_sitter#enabled'] = true
    vim.g['conjure#client#clojure#nrepl#refresh#before'] = 'mount/stop'
    vim.g['conjure#client#clojure#nrepl#refresh#after'] = 'mount/start'
    vim.g['conjure#client#clojure#nrepl#tap#enabled'] = true
    vim.g['conjure#client#clojure#nrepl#connection#auto_repl#cmd'] = 'clj -M:dev:test:clerk:repl/reloaded --port 7888'
    vim.g['conjure#log#wrap'] = true

    local function clerk_show()
      vim.cmd.write()
      vim.cmd('ConjureEval (nextjournal.clerk/show! "' .. vim.fn.expand('%:p') .. '")')
    end

    vim.keymap.set('n', '<localleader>cs', clerk_show, { silent = true, desc = 'Clerk Show' })

    vim.api.nvim_create_autocmd('BufNewFile', {
      pattern = 'conjure-log-*',
      callback = function(args)
        vim.diagnostic.enable(false, { bufnr = args.buf })
      end
    })
  end
}
