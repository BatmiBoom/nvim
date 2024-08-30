return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  priority = 999,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.install').prefer_git = true

    ---@diagnostic disable: missing-fields
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      sync_install = false,
      ignore_install = {},
      ensure_installed = {
        'bash',
        'cmake',
        'c',
        'cpp',
        'css',
        'diff',
        'gitignore',
        'gleam',
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
        'query',
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
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
