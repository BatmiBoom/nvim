return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = 'flex',
          layout_config = { height = 0.95 }
        },
        pickers = {},
        extensions = {
          ["ui-select"] = {
          },
        },
      })

      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end,
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").git_files()
        end,
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
      },
      {
        "<leader>sg",
        function()
          require("telescope.builtin").live_grep()
        end,
      },
      {
        "<leader>sw",
        function()
          require("telescope.builtin").grep_string()
        end,
      },
      {
        "<leader>dd",
        function()
          require("telescope.builtin").diagnostics(0)
        end,
      },
      {
        "<leader>gr",
        function()
          require("telescope.builtin").lsp_references()
        end,
      },
      {
        "<leader>gd",
        function()
          require("telescope.builtin").lsp_definitions()
        end,
      },
      {
        "<leader>gi",
        function()
          require("telescope.builtin").lsp_implementations()
        end,
      },
    },
  },
}
