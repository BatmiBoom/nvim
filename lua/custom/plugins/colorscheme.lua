return {
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
    'echasnovski/mini.base16',
    lazy = true,
    priority = 1000,
    config = function()
      require('mimi.base16').setup {
        palette = {
          base00 = '',
          base01 = '',
          base02 = '',
          base03 = '',
          base04 = '',
          base05 = '',
          base06 = '',
          base07 = '',
          base08 = '',
          base09 = '',
          base0A = '',
          base0B = '',
          base0C = '',
          base0D = '',
          base0E = '',
          base0F = '',
        },
      }
    end,
  },
  {
    'Abstract-IDE/Abstract-cs',
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'abscs'
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
    'nyoom-engineering/oxocarbon.nvim',
    lazy = true,
    priority = 1000,
    config = function()
      vim.opt.background = 'dark'
      vim.cmd.colorscheme 'oxocarbon'

      -- Transparency
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  {
    'sontungexpt/witch',
    priority = 1000,
    lazy = true,
    config = function()
      require('witch').setup {
        theme = {
          enabled = true,
          style = 'dark',
          extras = {
            bracket = true,
            diffview = true,
          },
          customs = {
            -- require("witch.theme.example"),
          },
          --- @param style string : the current style of the theme
          --- @param colors table : the current colors of the theme
          --- @param highlight table : the current highlights of the theme
          on_highlight = function(style, colors, highlight) end,
        },
        dim_inactive = {
          enabled = true,
          level = 0.48,
          excluded = {
            filetypes = {
              NvimTree = true,
            },
            buftypes = {
              nofile = true,
              prompt = true,
              terminal = true,
            },
          },
        },
        switcher = true,
        more_themes = {
          -- Custom1 = {},
          -- Custom2 = {},
        },
      }
    end,
  },
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false,
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
        color_overrides = {},
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
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
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
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = false,
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
