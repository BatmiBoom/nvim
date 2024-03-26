return {
  'echasnovski/mini.nvim',
  event = { 'VeryLazy' },
  config = function()
    -- Better Around/Inside textobjects
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]parenthen
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    require('mini.files').setup {
      content = {
        filter = nil,
        prefix = nil,
        sort = nil,
      },
      mappings = {
        close = 'q',
        go_in = 'l',
        go_in_plus = 'L',
        go_out = 'h',
        go_out_plus = 'H',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
      },
      options = {
        permanent_delete = true,
        use_as_default_explorer = true,
      },
      windows = {
        max_number = 2,
        preview = true,
        width_focus = 50,
        width_nofocus = 15,
        width_preview = 80,
      },
    }
  end,
}
