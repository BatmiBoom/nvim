return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'VeryLazy' },
  build = ':TSUpdate',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
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
        'typescript',
        'vimdoc',
        'vim',
        'zig',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
