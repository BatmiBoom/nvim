return {
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "warmer",                                                                    -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = false,                                                                 -- Show/hide background
        term_colors = true,                                                                  -- Change terminal color as per the selected theme style
        ending_tildes = false,                                                               -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false,                                                        -- reverse item kind highlights in cmp menu

        toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

        code_style = {
          comments = "none",
          keywords = "bold",
          functions = "italic",
          strings = "none",
          variables = "none",
        },

        -- Custom Highlights --
        colors = {},     -- Override default colors
        highlights = {}, -- Override highlight groups

        diagnostics = {
          darker = true,     -- darker colors for diagnostic
          undercurl = true,  -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      })

      require("onedark").load()
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

      require("nord").set()
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent_background = true,   -- set background to transparent
      gamma = 1.00,                    -- adjust the brightness of the theme
      styles = {
        comments = { italic = true },  -- style for comments
        keywords = {},                 -- style for keywords
        identifiers = {},              -- style for identifiers
        functions = { italic = true }, -- style for functions
        variables = { bold = true },   -- style for variables
      },
      terminal_colors = true,          -- enable terminal colors cfkj
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
      vim.cmd([[colorscheme tokyodark]])
    end,
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nightflyCursorColor = true
      vim.g.nightflyTerminalColors = true
      vim.g.nightflyTransparent = true
      vim.g.nightflyUndercurls = true
      vim.g.nightflyUnderlineMatchParen = true
      vim.g.nightflyVirtualTextColor = true
      vim.g.nightflyWinSeparator = 3

      vim.cmd([[colorscheme nightfly]])
    end,
  },
  {
    "rose-pine/neovim",
    lazy = true,
    priority = 1000,
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",      -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          headings = {
            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
          },
        },
        highlight_groups = {
          Comment = { fg = "foam" },
          VertSplit = { fg = "muted", bg = "muted" },
        },
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = true,   -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,    -- do not set background color
        dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
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
          light = "lotus",
        },
      })

      vim.cmd.colorscheme("kanagawa")
    end,
  },
}
