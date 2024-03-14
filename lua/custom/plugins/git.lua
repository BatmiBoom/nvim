return {
  'NeogitOrg/neogit',
  brach = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = true,
  keys = {
    {
      '<leader>g',
      function()
        require('neogit').open { kind = 'auto', cmd = '%:p:h' }
      end,
      {},
    },
  },
}
