return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {
      '<leader><leader>',
      function()
        require('fzf-lua').files()
      end,
      {},
    },
    {
      '<leader>fw',
      function()
        require('fzf-lua').live_grep_native()
      end,
      {},
    },
  },
  config = function()
    require('fzf-lua').setup {
      winopts = {
        split = 'belowright new',
        height = 0.85, -- window height
        width = 0.80, -- window width
        row = 0.35, -- window row position (0=top, 1=bottom)
        col = 0.50, -- window col position (0=left, 1=right)
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        fullscreen = false, -- start fullscreen?
        preview = {
          default = 'bat',
          border = 'border', -- border|noborder, applies only to
          wrap = 'nowrap', -- wrap|nowrap
          hidden = 'nohidden', -- hidden|nohidden
          vertical = 'down:45%', -- up|down:size
          horizontal = 'right:60%', -- right|left:size
          layout = 'flex', -- horizontal|vertical|flex
          flip_columns = 120, -- #cols to switch to horizontal on flex
          title = true, -- preview border title (file/buf)?
          title_pos = 'center', -- left|center|right, title alignment
          scrollbar = 'float', -- `false` or string:'float|border'
          scrolloff = '-2', -- float scrollbar offset from right
          scrollchars = { '█', '' }, -- scrollbar chars ({ <full>, <empty> }
          delay = 100, -- delay(ms) displaying the preview
          winopts = { -- builtin previewer window options
            number = true,
            relativenumber = false,
            cursorline = true,
            cursorlineopt = 'both',
            cursorcolumn = false,
            signcolumn = 'no',
            list = false,
            foldenable = false,
            foldmethod = 'manual',
          },
        },
      },
    }

    local fzf = require 'fzf-lua'
    vim.keymap.set('n', '<leader>fh', fzf.helptags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>fg', fzf.grep_cword, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>fd', fzf.diagnostics_document, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>fr', fzf.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>f.', fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>fw.', fzf.lgrep_curbuf, { desc = '[S]earch [/] in Open Files' })
  end,
}
