require('plugins')
require('core')
require('mappings')

local function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^cnull') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('ReloadConfig', ReloadConfig, {})
