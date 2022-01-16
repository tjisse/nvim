vim.cmd[[
  autocmd BufEnter *.clj let b:fswitchdst = 'clj' | let b:fswitchfnames = '/$/_test/' | let b:fswitchlocs = 'reg:/src/test/'
  autocmd BufEnter *_test.clj let b:fswitchdst = 'clj' | let b:fswitchfnames = '/_test$//' | let b:fswitchlocs = 'reg:/test/src/'
]]
