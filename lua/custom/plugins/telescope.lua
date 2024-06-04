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
      function()
        require('telescope.builtin').find_files()
      end,
      {},
    },
    {
      '<leader>fw',
      function()
        require('telescope.builtin').live_grep()
      end,
      {},
    },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_config = {
          vertical = { width = 0.5 },
        },
      },
    }

    require('telescope').load_extension 'fzy_native'

    local telescope = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>fg', telescope.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>fd', telescope.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>fr', telescope.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>f.', telescope.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = '[ ] Find existing buffers' })
  end,
}
