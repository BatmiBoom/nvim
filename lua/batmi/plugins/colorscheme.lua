return {
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'warmer',                                                                    -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = false,                                                                 -- Show/hide background
        term_colors = true,                                                                  -- Change terminal color as per the selected theme style
        ending_tildes = false,                                                               -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false,                                                        -- reverse item kind highlights in cmp menu

        toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

        code_style = {
          comments = 'none',
          keywords = 'bold',
          functions = 'italic',
          strings = 'none',
          variables = 'none'
        },

        -- Custom Highlights --
        colors = {},     -- Override default colors
        highlights = {}, -- Override highlight groups

        diagnostics = {
          darker = true,     -- darker colors for diagnostic
          undercurl = true,  -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      }

      require('onedark').load()
    end,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false

      require('nord').set()
    end
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,                                      -- set background to transparent
      gamma = 1.00,                                                        -- adjust the brightness of the theme
      styles = {
        comments = { italic = true },                                      -- style for comments
        keywords = { italic = true },                                      -- style for keywords
        identifiers = { italic = true },                                   -- style for identifiers
        functions = {},                                                    -- style for functions
        variables = {},                                                    -- style for variables
      },
      terminal_colors = true,                                              -- enable terminal colors cfkj
    },
    config = function(_, opts)
      require("tokyodark").setup(opts)   -- calling setup is optional
      vim.cmd [[colorscheme tokyodark]]
    end,
  },
  {
    "rose-pine/neovim",
    lazy = true,
    priority = 1000,
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        variant = 'moon', -- 'auto' | 'main' | 'moon' | 'dawn'
        dark_variant = 'moon',
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
        disable_italics = false,

        groups = {
          background = 'base',
          background_nc = '_experimental_nc',
          panel = 'surface',
          panel_nc = 'base',
          border = 'highlight_med',
          comment = 'muted',
          link = 'iris',
          punctuation = 'subtle',

          error = 'love',
          hint = 'iris',
          info = 'foam',
          warn = 'gold',

          headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
          }
        },
        highlight_groups = {
          ColorColumn = { bg = 'rose' },
          CursorLine = { bg = 'foam', blend = 10 },
          StatusLine = { fg = 'love', bg = 'love', blend = 10 },
          Search = { bg = 'gold', inherit = false },
        }
      })

      vim.cmd('colorscheme rose-pine')
    end
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        compile = true,   -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,   -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {             -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        background = {     -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus"
        },
      })

      vim.cmd.colorscheme("kanagawa")
    end,
  },
}
