return {
  'nvim-treesitter/nvim-treesitter',
  build = function()
    vim.cmd 'TSUpdate'
  end,
  lazy = false,
  config = function()
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
        -- Disable slow treesitter highlight for large files
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<Enter>', -- set to `false` to disable one of the mappings
          node_incremental = '<Enter>',
          scope_incremental = false,
          node_decremental = '<Backspace>',
        },
      },
    }
  end,
}
