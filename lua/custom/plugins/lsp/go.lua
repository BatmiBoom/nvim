return {
  'crispgm/nvim-go',
  dependecies = {
    'neovim/nvim-lspconfig',
  },
  ft = 'go',
  config = function()
    require('go').setup {}
  end,
}
