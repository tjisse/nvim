vim.g['conjure#completion#omnifunc'] = ''
vim.g['conjure#mapping#doc_word'] = false
vim.g['conjure#extract#tree_sitter#enabled'] = true
vim.g['conjure#client#clojure#nrepl#refresh#before'] = 'mount/stop'
vim.g['conjure#client#clojure#nrepl#refresh#after'] = 'mount/start'
vim.g['conjure#log#wrap'] = true

vim.api.nvim_create_autocmd('BufNewFile', { pattern = 'conjure-log-*', command = 'lua vim.diagnostic.disable(0)' })
