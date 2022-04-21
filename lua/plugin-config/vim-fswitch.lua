vim.cmd[[
  autocmd BufEnter *.clj let b:fswitchdst = 'clj' | let b:fswitchfnames = '/$/_test/' | let b:fswitchlocs = 'reg:/src/test/'
  autocmd BufEnter *_test.clj let b:fswitchdst = 'clj' | let b:fswitchfnames = '/_test$//' | let b:fswitchlocs = 'reg:/test/src/'
  autocmd BufEnter *.mjs let b:fswitchdst = 'mjs' | let b:fswitchfnames = '/$/.test/' | let b:fswitchlocs = 'reg:/src/test/'
  autocmd BufEnter *.test.mjs let b:fswitchdst = 'mjs' | let b:fswitchfnames = '/.test$//' | let b:fswitchlocs = 'reg:/test/src/'
  autocmd BufEnter *.js let b:fswitchdst = 'js' | let b:fswitchfnames = '/$/.test/' | let b:fswitchlocs = 'reg:/src/test/'
  autocmd BufEnter *.test.js let b:fswitchdst = 'js' | let b:fswitchfnames = '/.test$//' | let b:fswitchlocs = 'reg:/test/src/'
]]
