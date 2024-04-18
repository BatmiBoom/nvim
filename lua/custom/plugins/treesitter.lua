return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'VeryLazy' },
  build = ':TSUpdate',
  opts = {
    auto_install = true,
    sync_install = false,
    ignore_install = {},
    ensure_installed = {
      'bash',
      'cmake',
      'c',
      'cpp',
      'css',
      'gitignore',
      'go',
      'html',
      'javascript',
      'json',
      'jsonc',
      'lua',
      'markdown',
      'markdown_inline',
      'odin',
      'python',
      'regex',
      'rust',
      'sql',
      'tsx',
      'toml',
      'typescript',
      'vimdoc',
      'vim',
      'zig',
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.install').prefer_git = true

    require('nvim-treesitter.configs').setup(opts)
  end,
}
