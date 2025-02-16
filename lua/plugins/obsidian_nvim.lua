return {
  'epwalsh/obsidian.nvim',
  version = '*',
  event = {
    'BufReadPre /home/tjisse/OneDrive/Apps/Remotely Secure/Notes/**.md',
    'BufNewFile /home/tjisse/OneDrive/Apps/Remotely Secure/Notes/**.md',
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    workspaces = {
      {
        name = 'Notes',
        path = '~/OneDrive/Apps/Remotely Secure/Notes',
      },
    },
  },
}
