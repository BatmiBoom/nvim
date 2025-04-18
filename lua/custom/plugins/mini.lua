return {
  {
    'echasnovski/mini.ai',
    version = false,
    dependencies = {
      { 'echasnovski/mini.surround', version = false },
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
        },
      }
    end,
  },
  {
    'echasnovski/mini.statusline',
    event = 'VeryLazy',
    version = false,
    config = function()
      require('mini.statusline').setup()
    end,
  },
}
