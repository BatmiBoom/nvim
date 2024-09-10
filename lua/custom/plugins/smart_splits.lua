return {
  'mrjones2014/smart-splits.nvim',
  lazy = false,
  config = function()
    require('smart-splits').setup {
      ignored_buftypes = {
        'nofile',
        'quickfix',
        'prompt',
      },
      -- ignored_filetypes = { 'NvimTree' },
      default_amount = 3,
      -- 'wrap' => Wrap to opposite side
      -- 'split' => Create a new split in the desired direction
      -- 'stop' => Do nothing
      at_edge = 'wrap',
      -- Desired behavior when the current window is floating:
      -- 'previous' => Focus previous Vim window and perform action
      -- 'mux' => Always forward action to multiplexer
      float_win_behavior = 'previous',
      move_cursor_same_row = false,
      cursor_follows_swapped_bufs = false,
      resize_mode = {
        quit_key = '<ESC>',
        resize_keys = { 'h', 'j', 'k', 'l' },
        silent = true,
      },
      ignored_events = {
        'BufEnter',
        'WinEnter',
      },
      -- disable multiplexer navigation if current multiplexer pane is zoomed
      -- this functionality is only supported on tmux and Wezterm due to kitty
      -- not having a way to check if a pane is zoomed
      disable_multiplexer_nav_when_zoomed = true,
      -- default logging level, one of: 'trace'|'debug'|'info'|'warn'|'error'|'fatal'
      log_level = 'info',
    }

    --resize
    vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)

    -- moving between splits
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
    -- swapping buffers between windows
    vim.keymap.set('n', '<C-A-h>', require('smart-splits').swap_buf_left)
    vim.keymap.set('n', '<C-A-j>', require('smart-splits').swap_buf_down)
    vim.keymap.set('n', '<C-A-k>', require('smart-splits').swap_buf_up)
    vim.keymap.set('n', '<C-A-l>', require('smart-splits').swap_buf_right)
  end,
}
