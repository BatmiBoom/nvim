return {
  'echasnovski/mini.ai',
  dependencies = {
    'echasnovski/mini.surround',
    'echasnovski/mini.pairs',
  },
  event = { 'InsertEnter' },
  config = function()
    -- Better Around/Inside textobjects
    -- Examples:
    --  va)  - [V]isually select [A]round [)]parenthen
    --  yinq - [Y]ank [I]nside [N]ext [']quote
    --  ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    -- saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- sd'   - [S]urround [D]elete [']quotes
    -- sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup {
      mappings = {
        add = 'ya', -- Add surrounding in Normal and Visual modes
        delete = 'yd', -- Delete surrounding
        find = 'yf', -- Find surrounding (to the right)
        find_left = 'yF', -- Find surrounding (to the left)
        highlight = 'yh', -- Highlight surrounding
        replace = 'yr', -- Replace surrounding
        update_n_lines = 'yn', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    }

    require('mini.pairs').setup()
  end,
}
