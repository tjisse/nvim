local lint = require('lint')

lint.linters_by_ft = {
  java = { 'checkstyle' }
}

lint.linters.checkstyle.cmd = 'checkstyle.bat'
lint.linters.checkstyle.config_file = 'rules-checkstyle.xml'
