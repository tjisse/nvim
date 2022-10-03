local lint = require('lint')

lint.linters_by_ft = {
  java = { 'checkstyle' }
}

if vim.fn.has('win32') == 1 then
  lint.linters.checkstyle.cmd = 'checkstyle.bat'
end
lint.linters.checkstyle.config_file = 'rules-checkstyle.xml'
