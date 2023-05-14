return {
  {
    "ray-x/aurora",
    config = function ()
      vim.g.aurora_italic = "italic"
      -- vim.g.aurora_transparent = "transparent"
      vim.g.aurora_bold = "bold"
      -- vim.g.aurora_darker = "darker background"
    end
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    -- config = function(_, opts)
    --   require("onedark").setup(opts)
    --   require("onedark").load()
    -- end,
    opts = {
      style = "deep",               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = false,          -- Show/hide background
      term_colors = true,           -- Change terminal color as per the selected theme style
      ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
      toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      colors = {},     -- Override default colors
      highlights = {}, -- Override highlight groups
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
  },
  {
    "gbprod/nord.nvim",
    config = function()
      require("nord").setup({
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
        borders = true,     -- Enable the border between verticaly split windows visible
        errors = { mode = "bg" }, -- Display mode for errors and diagnostics
        -- values : [bg|fg|none]
        styles = {
          comments = { italic = true },
          keywords = {},
          functions = {},
          variables = {},
          bufferline = {
            current = {},
            modified = { italic = true },
          },
        },
        colorblind = {
          enable = false,
          preserve_background = false,
          severity = {
            protan = 0.0,
            deutan = 0.0,
            tritan = 0.0,
          },
        }
      })
    end
    -- config = function()
    --   require("nord").set()
    -- end,
  },
  {
    "shaunsingh/moonlight.nvim",
    lazy = true,
    -- config = function ()
    --   vim.g.moonlight_italic_comments = true
    --   vim.g.moonlight_italic_keywords = true
    --   vim.g.moonlight_italic_functions = true
    --   vim.g.moonlight_italic_variables = false
    --   vim.g.moonlight_contrast = true
    --   vim.g.moonlight_borders = false
    --   vim.g.moonlight_disable_background = false

    --   require('moonlight').set()
    -- end
  },
  {
    "nvimdev/zephyr-nvim",
    lazy = true,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
  },
}
