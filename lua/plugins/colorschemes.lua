return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  lazy = false,
  build = function()
    vim.cmd 'KanagawaCompile'
  end,
  config = function()
    require('kanagawa').setup {
      compile = true,
      transparent = false,
      theme = 'dragon',
    }

    vim.cmd 'colorscheme kanagawa'
  end,
}
