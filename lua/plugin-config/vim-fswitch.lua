local set_keymap = vim.api.nvim_set_keymap
local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd('BufEnter',
  { pattern = '*.clj',
    command = "let b:fswitchdst = 'clj' | let b:fswitchfnames = '/$/_test/' | let b:fswitchlocs = 'reg:/main/test/'" })
create_autocmd('BufEnter',
  { pattern = '*_test.clj',
    command = "let b:fswitchdst = 'clj' | let b:fswitchfnames = '/_test$//' | let b:fswitchlocs = 'reg:/test/main/'" })
create_autocmd('BufEnter',
  { pattern = '*.cljs',
    command = "let b:fswitchdst = 'cljs' | let b:fswitchfnames = '/$/_test/' | let b:fswitchlocs = 'reg:/main/test/'" })
create_autocmd('BufEnter',
  { pattern = '*_test.cljs',
    command = "let b:fswitchdst = 'cljs' | let b:fswitchfnames = '/_test$//' | let b:fswitchlocs = 'reg:/test/main/'" })
create_autocmd('BufEnter',
  { pattern = '*.mjs',
    command = "let b:fswitchdst = 'mjs' | let b:fswitchfnames = '/$/.test/' | let b:fswitchlocs = 'reg:/src/test/'" })
create_autocmd('BufEnter',
  { pattern = '*.test.mjs',
    command = "let b:fswitchdst = 'mjs' | let b:fswitchfnames = '/.test$//' | let b:fswitchlocs = 'reg:/test/src/'" })
create_autocmd('BufEnter',
  { pattern = '*.js',
    command = "let b:fswitchdst = 'js' | let b:fswitchfnames = '/$/.test/' | let b:fswitchlocs = 'reg:/src/test/'" })
create_autocmd('BufEnter',
  { pattern = '*.test.js',
    command = "let b:fswitchdst = 'js' | let b:fswitchfnames = '/.test$//' | let b:fswitchlocs = 'reg:/test/src/'" })
create_autocmd('BufEnter',
  { pattern = '*.java',
    command = "let b:fswitchdst = 'java' | let b:fswitchfnames = '/$/Test/' | let b:fswitchlocs = 'reg:/main/test/'" })
create_autocmd('BufEnter',
  { pattern = '*Test.java',
    command = "let b:fswitchdst = 'java' | let b:fswitchfnames = '/Test$//' | let b:fswitchlocs = 'reg:/test/main/'" })

set_keymap('n', '<Leader>pa', ':FSHere<CR>', { silent = true, noremap = true, desc = 'switch to test/implementation' })
