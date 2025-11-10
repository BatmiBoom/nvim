vim.pack.add {
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    branch = 'main',
    run = function()
      vim.cmd 'TSUpdate'
    end,
  },
}

require('nvim-treesitter.configs').setup {
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
  ignore_install = {},
  modules = {},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}
