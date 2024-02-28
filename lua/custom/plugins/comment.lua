return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('Comment').setup {
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      mappings = {
        --  `gcc`               -> line-comment  the current line
        --  `gcb`               -> block-comment the current line
        --  `gc[count]{motion}` -> line-comment  the region contained in {motion}
        --  `gb[count]{motion}` -> block-comment the region contained in {motion}
        basic = true,
        -- Includes `gco`, `gcO`, `gcA`
        extra = true,
      },
      toggler = {
        line = 'gcc',
        block = 'gbc',
      },
    }

    local comment_ft = require 'Comment.ft'
    comment_ft.set('lua', { '--%s', '--[[%s]]' })
  end,
}
