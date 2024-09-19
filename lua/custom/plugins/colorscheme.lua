return {
  {
    'folke/tokyonight.nvim',
    lazy = true,
    priority = 1000,
    opts = {},
    config = function()
      require('tokyonight').setup {
        style = 'storm', -- storm night day
        light_style = 'day',
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = 'transparent', -- dark transparent normal
          floats = 'transparent',
        },
        day_brightness = 0.3,
        dim_inactive = false,
        cache = true,
        plugins = {
          auto = true,
        },
      }

      vim.cmd [[colorscheme tokyonight]] -- tokyonight-night tokyonight-storm tokyonight-day tokyonight-moon
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('nightfox').setup {
        options = {
          compile_path = vim.fn.stdpath 'cache' .. '/nightfox',
          compile_file_suffix = '_compiled',
          transparent = false,
          terminal_colors = true,
          dim_inactive = false,
          module_default = true,
          colorblind = {
            enable = false,
            simulate_only = false,
            severity = {
              protan = 0,
              deutan = 0,
              tritan = 0,
            },
          },
          styles = { -- Value is any valid attr-list value `:help attr-list`
            comments = 'NONE',
            conditionals = 'NONE',
            constants = 'NONE',
            functions = 'italic',
            keywords = 'bold',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
            types = 'italic,bold',
            variables = 'NONE',
          },
          inverse = {
            match_paren = false,
            visual = false,
            search = false,
          },
        },
      }

      vim.cmd 'colorscheme carbonfox' -- nightfox, duskfox, nordfox, terafox, carbonfox
    end,
  },
  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      require('dracula').setup {
        colors = {
          bg = '#282A36',
          fg = '#F8F8F2',
          selection = '#44475A',
          comment = '#6272A4',
          red = '#FF5555',
          orange = '#FFB86C',
          yellow = '#F1FA8C',
          green = '#50fa7b',
          purple = '#BD93F9',
          cyan = '#8BE9FD',
          pink = '#FF79C6',
          bright_red = '#FF6E6E',
          bright_green = '#69FF94',
          bright_yellow = '#FFFFA5',
          bright_blue = '#D6ACFF',
          bright_magenta = '#FF92DF',
          bright_cyan = '#A4FFFF',
          bright_white = '#FFFFFF',
          menu = '#21222C',
          visual = '#3E4452',
          gutter_fg = '#4B5263',
          nontext = '#3B4048',
          white = '#ABB2BF',
          black = '#191A21',
        },
        show_end_of_buffer = true,
        transparent_bg = true,
        italic_comment = true,
      }

      vim.cmd [[colorscheme dracula]]
    end,
  },
  {
    'comfysage/evergarden',
    priority = 1000,
    lazy = true,
    config = function()
      require('evergarden').setup {
        transparent_background = true,
        contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
        override_terminal = true,
        style = {
          tabline = { reverse = true, color = 'green' },
          search = { reverse = false, inc_reverse = true },
          types = { italic = true },
          keyword = { italic = true },
          comment = { italic = false },
          sign = { highlight = false },
        },
        overrides = {}, -- add custom overrides
      }

      vim.cmd [[colorscheme evergarden]]
    end,
  },
  {
    'rafamadriz/neon',
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.neon_style = 'doom'
      vim.g.neon_italic_comment = true
      vim.g.neon_italic_keyword = true
      vim.g.neon_italic_function = true
      vim.g.neon_italic_variable = false
      vim.g.neon_bold = true
      vim.g.neon_transparent = false

      vim.cmd [[colorscheme neon]]
    end,
  },
  {
    'maxmx03/fluoromachine.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      local fm = require 'fluoromachine'
      fm.setup {
        glow = true,
        theme = 'retrowave',
      }
      vim.cmd.colorscheme 'fluoromachine'
    end,
  },
  {
    'catppuccin/nvim',
    lazy = true,
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = 'dark',
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        color_overrides = {
          all = {
            text = '#ffffff',
          },
          mocha = {
            base = '#1e1e21',
          },
          frappe = {},
          macchiato = {},
          latte = {},
        },
        custom_highlights = {},
        integrations = {
          cmp = true,
          diffview = true,
          treesitter = true,
          fidget = true,
          dap = true,
          flash = true,
          dap_ui = true,
          mason = true,
          neogit = true,
          markdown = true,
          telescope = true,
          native_lsp = true,
          rainbow_delimiters = true,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
        },
      }

      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        compile = true, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        background = {
          dark = 'dragon',
          light = 'lotus',
        },
      }

      vim.cmd 'colorscheme kanagawa'
    end,
  },
  {
    'rose-pine/neovim',
    lazy = true,
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'auto', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },

        groups = {
          border = 'muted',
          link = 'iris',
          panel = 'surface',

          error = 'love',
          hint = 'iris',
          info = 'foam',
          note = 'pine',
          todo = 'rose',
          warn = 'gold',

          git_add = 'foam',
          git_change = 'rose',
          git_delete = 'love',
          git_dirty = 'rose',
          git_ignore = 'muted',
          git_merge = 'iris',
          git_rename = 'pine',
          git_stage = 'iris',
          git_text = 'rose',
          git_untracked = 'subtle',

          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },
      }

      vim.cmd 'colorscheme rose-pine'
      -- vim.cmd("colorscheme rose-pine-main")
      -- vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-dawn")
    end,
  },
}
