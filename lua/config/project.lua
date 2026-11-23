local M = {}
local directory = vim.fn.stdpath('state') .. '/projects'

function M.save()
  local session = vim.t.project_session
  if not session then return end

  vim.fn.mkdir(directory, 'p', 448)
  local options, previous = vim.o.sessionoptions, vim.v.this_session
  local temp = session .. '.' .. vim.fn.getpid()
  -- Scope still has this tab's buffers listed in its pre_tab_leave hook.
  vim.o.sessionoptions = 'buffers,folds,winsize'
  local ok, err = pcall(vim.cmd.mksession, { args = { vim.fn.fnameescape(temp) }, bang = true })
  vim.o.sessionoptions, vim.v.this_session = options, previous
  if ok then ok, err = vim.uv.fs_rename(temp, session) end
  if not ok then
    vim.fn.delete(temp)
    vim.notify('Saving project failed: ' .. tostring(err), vim.log.levels.ERROR)
  end
end

function M.open(name, path)
  local root = vim.uv.fs_realpath(path)
  if not root or vim.fn.isdirectory(root) == 0 then
    return vim.notify('Missing project directory: ' .. path, vim.log.levels.WARN)
  end
  local session = directory .. '/' .. vim.fn.sha256(root) .. '.vim'
  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    if vim.t[tab].project_session == session then
      vim.api.nvim_set_current_tabpage(tab)
      return
    end
  end

  if vim.t.project_session or #vim.api.nvim_tabpage_list_wins(0) > 1
      or #vim.fn.getbufinfo({ buflisted = 1 }) > 1 or vim.api.nvim_buf_get_name(0) ~= ''
      or vim.bo.modified or vim.bo.buftype ~= '' then
    vim.cmd.tabnew()
  end
  vim.cmd.tcd(vim.fn.fnameescape(root))
  vim.t.name = name
  if vim.fn.filereadable(session) == 1 then
    vim.cmd.source(vim.fn.fnameescape(session))
  else
    Snacks.picker.files({ cwd = root })
  end
  vim.t.project_session = session
end

return M
