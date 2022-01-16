vim.g.clap_theme = 'atom_dark'
vim.g.clap_provider_files_opts = '-g "!.git/"'

vim.cmd[[autocmd FileType clap_input lua require('cmp').setup.buffer { enabled = false }]]
