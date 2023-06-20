return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      if vim.fn.has("win32") then
        require("nvim-treesitter.install").compilers = { "clang" }
      end
      require("nvim-treesitter.configs").setup({
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
          "zig",
          "yaml",
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "typescriptreact", "javascript", "javascriptreact", "html", "vue", "svelte" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
}
