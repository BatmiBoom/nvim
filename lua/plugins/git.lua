return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'ibhagwan/fzf-lua',
  },
  keys = {
    {
      '<leader>g',
      function()
        require('neogit').open { kind = 'split_below_all' }
      end,
      desc = 'Open Git',
    },
  },
}
