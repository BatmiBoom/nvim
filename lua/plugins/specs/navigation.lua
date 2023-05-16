local fn, api = vim.fn, vim.api

return {
  {
    "TimUntersberger/neofs",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("neofs").setup({
        devicons = true,
      })
    end,
    keys = {
      {
        "<leader>e",
        function()
          require("neofs").open()
        end,
        desc = "Open file tree",
      },
    },
  },
}
