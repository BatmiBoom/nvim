return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.install').compilers = { 'clang' }
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "bash",
          "c",
          "css",
          "html",
          "javascript",
          "json",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "go",
          "query",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          disable = { 'help' },
          keymaps = {
            init_selection = '<CR>', -- maps in normal mode to init the node/scope selection
            node_incremental = '<CR>', -- increment to the upper named parent
            node_decremental = '<C-CR>', -- decrement to the previous node
          },
        },
        indent = {
          enable = true,
          disable = { 'yaml' },
        },
        textobjects = {
          lookahead = true,
          select = {
            enable = true,
            include_surrounding_whitespace = true,
            keymaps = {
              ['af'] = { query = '@function.outer', desc = 'ts: all function' },
              ['if'] = { query = '@function.inner', desc = 'ts: inner function' },
              ['ac'] = { query = '@class.outer', desc = 'ts: all class' },
              ['ic'] = { query = '@class.inner', desc = 'ts: inner class' },
              ['aC'] = { query = '@conditional.outer', desc = 'ts: all conditional' },
              ['iC'] = { query = '@conditional.inner', desc = 'ts: inner conditional' },
              ['aL'] = { query = '@assignment.lhs', desc = 'ts: assignment lhs' },
              ['aR'] = { query = '@assignment.rhs', desc = 'ts: assignment rhs' },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = { [']m'] = '@function.outer', [']M'] = '@class.outer' },
            goto_previous_start = { ['[m'] = '@function.outer', ['[M'] = '@class.outer' },
          },
        },
        rainbow = {
          enable = true,
          disable = { 'lua', 'tsx', 'jsx', 'html' },
          query = {
            'rainbow-parens',
            html = 'rainbow-tags', -- TODO: fix the awful default appearance
          },
          strategy = {
            dart = require('ts-rainbow.strategy.global'),
          },
        },
        autopairs = { enable = true },
        context_commentstring = { enable = true },
        playground = { persist_queries = true },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { 'BufWrite', 'CursorHold' },
        },
      })
    end,
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      { 'HiPhish/nvim-ts-rainbow2' },
      { 'JoosepAlviste/nvim-ts-context-commentstring' },
    },
  },
  {
    'windwp/nvim-ts-autotag',
    ft = { 'typescriptreact', 'javascript', 'javascriptreact', 'html', 'vue', 'svelte' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = true,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'VeryLazy',
    opts = {
      multiline_threshold = 4,
      separator = { '─', 'ContextBorder' }, -- alternatives: ▁ ─ ▄
      mode = 'cursor',
    },
  },
}
