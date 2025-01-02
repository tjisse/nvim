require('fidget').setup({
  progress = {
    suppress_on_insert = true,
    ignore_done_already = true,
    display = {
      render_limit = 3
    },
  },
  notification = {
    override_vim_notify = true,
  },
})
