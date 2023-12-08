return {
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "cmake",
          "c",
          "cpp",
          "css",
          "gitignore",
          "go",
          "html",
          "javascript",
          "json",
          "jsonc",
          "lua",
          "markdown",
          "markdown_inline",
          "odin",
          "python",
          "regex",
          "rust",
          "sql",
          "tsx",
          "typescript",
          "vimdoc",
          "vim",
          "zig"
        },
        ignore_install = {},
        modules = {},
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["a="] = { query = "@assignment,outer" },
              ["i="] = { query = "@assignment,inner" },
              ["l="] = { query = "@assignment,lsh" },
              ["r="] = { query = "@assignment,rhs" },

              ["aa"] = { query = "@parameter.outer" },
              ["ia"] = { query = "@parameter.inner" },

              ["ai"] = { query = "@conditional.outer" },
              ["ii"] = { query = "@conditional.inner" },

              ["al"] = { query = "@loop.outer" },
              ["il"] = { query = "@loop.inner" },

              ["af"] = { query = "@call.outer" },
              ["if"] = { query = "@call.inner" },

              ["am"] = { query = "@function.outer" },
              ["im"] = { query = "@function.inner" },

              ["ac"] = { query = "@class.outer" },
              ["ic"] = { query = "@class.inner" },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>na"] = "@parameter.inner",
              ["<leader>nm"] = "@function.outer",
            },
            swap_previous = {
              ["<leader>pa"] = "@parameter.inner",
              ["<leader>pm"] = "@function.outer",
            },
          },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
}
