vim.pack.add {
  {
    src = 'https://github.com/romus204/tree-sitter-manager.nvim',
    branch = 'main',
    run = function()
      vim.cmd 'TSUpdate'
    end,
  },
}

require('tree-sitter-manager').setup {
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
  auto_install = true, -- if enabled, install missing parsers when editing a new file
  highlight = true, -- treesitter highlighting is enabled by default
  -- languages = {}, -- override or add new parser sources
  -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
  -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
}
