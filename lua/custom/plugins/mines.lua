return {
  {
    'batmikun/mactions.nvim',
    event = 'VeryLazy',
    config = function()
      local mk = require 'mactions'

      vim.keymap.set('n', '<leader>mtc', function()
        mk.generate_toc()
      end)
      vim.keymap.set('n', '<leader>mti', function()
        mk.toggle_item_list()
      end)
    end,
  },
}
