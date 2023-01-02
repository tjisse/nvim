require('vscode').setup({
    italic_comments = true,
})

vim.cmd[[
    hi DiffChange guibg=#174d6e
    hi DiffText guibg=#1f6a98
    hi MatchParen guifg=#ef5f70 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
]]

