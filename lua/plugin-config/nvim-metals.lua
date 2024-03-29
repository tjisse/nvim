local metals_config = require("metals").bare_config()
local lsp_pluginconfig = require("plugin-config.nvim-lspconfig")

local function metals_status_handler(err, status, ctx)
  local val = {}
  -- trim and remove spinner
  local text = status.text:gsub('[⠇⠋⠙⠸⠴⠦]', ''):gsub("^%s*(.-)%s*$", "%1")
  if status.hide then
    val = {kind = 'end'}
  elseif status.show then
    val = {kind = 'begin', title = text}
  elseif status.text then
    val = {kind = 'report', message = text}
  else
    return
  end
  local msg = {token = "metals", value = val}
  vim.lsp.handlers["$/progress"](err, msg, ctx)
end

metals_config = {
  init_options = {
    statusBarProvider = 'on',
  },
  handlers = {['metals/status'] = metals_status_handler},
  settings = {
    showImplicitArguments = true,
    excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local dap = require("dap")

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

metals_config.on_attach = function(client, bufnr)
  lsp_pluginconfig.on_attach()
  require("metals").setup_dap()
end

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
