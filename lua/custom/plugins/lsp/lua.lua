return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        { path = 'wezterm-types', mods = { 'wezterm' } },
      },
    },
  },
  {
    'Bilal2453/luvit-meta',
    lazy = true,
  },
  {
    'justinsgithub/wezterm-types',
    lazy = true,
  },
}
