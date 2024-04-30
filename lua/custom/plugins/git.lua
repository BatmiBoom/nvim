return {
  'NeogitOrg/neogit',
  brach = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'ibhagwan/fzf-lua',
  },
  config = true,
  keys = {
    {
      '<leader>g',
      function()
        require('neogit').open { kind = 'auto', cwd = '%:p:h' }
      end,
      {},
    },
  },
}
