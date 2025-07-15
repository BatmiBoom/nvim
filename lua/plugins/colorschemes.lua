return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    lazy = true,
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
  },
  {
    'github-main-user/lytmode.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('lytmode').setup {
        transparent = false,
        italic_comments = true,
        italic_inlayhints = true,
        underline_links = true,
        disable_nvimtree_bg = true,
        terminal_colors = true,
        color_overrides = {
          lytLineNumber = '#FFFFFF',
        },
      }

      vim.cmd 'colorscheme lytmode'
    end,
  },
}
