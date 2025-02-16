return {
  'natecraddock/workspaces.nvim',
  opts = {
    cd_type = 'tab',
    hooks = {
      open = {
        function(workspace_name)
          local tab_handle = vim.api.nvim_get_current_tabpage()
          require('bufferline.tabpages').rename_tab(tab_handle, workspace_name)
          Snacks.picker.files()
        end
      },
    }
  },
}
