return {
  'ej-shafran/compile-mode.nvim',
  event = 'VeryLazy',
  branch = 'nightly',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'm00qek/baleia.nvim', tag = 'v1.3.0' },
  },
  config = function()
    vim.g.compile_mode = {
      baleia_setup = true,
    }
  end,
}
