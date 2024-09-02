return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    'nvim-telescope/telescope-live-grep-args.nvim',
    'echasnovski/mini.icons',
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {
      '<leader><leader>',
      function()
        require('telescope.builtin').find_files {
          find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
        }
      end,
    },
    {
      '<leader>fw',
      require('telescope.builtin').live_grep,
    },
  },
  config = function()
    local telescope = require 'telescope'
    telescope.setup {
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
        },
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
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
        live_grep_args = {
          auto_quoting = true,
        },
      },
    }

    telescope.load_extension 'fzf'
    telescope.load_extension 'live_grep_args'

    local actions = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fd', actions.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>fb', actions.buffers, { desc = '[L]ist open buffers' })
    vim.keymap.set('n', '<leader>fh', actions.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>/', function()
      actions.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
        relative = 'editor',
      })
    end, { desc = '[F]ind in current buffer' })
  end,
}
