return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-telescope/telescope-fzy-native.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {
      '<leader><leader>',
      require('telescope.builtin').find_files,
    },
    {
      '<leader>fw',
      require('telescope.builtin').live_grep,
    },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_strategy = 'flex',
        layout_config = {
          horizontal = {
            width = 0.9,
            height = 0.4,
          },
          vertical = {
            width = 0.9,
            height = 0.9,
          },
        },
      },
    }

    require('telescope').load_extension 'fzy_native'

    local telescope = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>fd', telescope.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = '[ ] Find existing buffers' })
  end,
}
