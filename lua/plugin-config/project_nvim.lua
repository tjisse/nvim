require('telescope').load_extension('projects')
require('project_nvim').setup {
  patterns = { '!=service', '!=itest', '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', '.sln', 'deps.edn', 'project.clj', 'pom.xml', 'build.gradle' },
  detection_methods = { 'pattern', 'lsp' },
  scope_chdir = 'win',
}
