return {
  'ibhagwan/fzf-lua',
  dependencies = { 'echasnovski/mini.icons' },
  keys = {
    {
      '<leader>f',
      function()
        require('fzf-lua').files()
      end,
      desc = 'Open Files Picker',
    },
    {
      '<leader>b',
      function()
        require('fzf-lua').buffers()
      end,
      desc = 'Open Buffer Picker',
    },
    {
      '<leader>/',
      function()
        require('fzf-lua').live_grep_native()
      end,
      desc = 'Open Live Grep',
    },
    {
      '<leader>pr',
      function()
        require('fzf-lua').resume()
      end,
      desc = '[F]ind [R]esume',
    },
  },
  opts = {},
}
