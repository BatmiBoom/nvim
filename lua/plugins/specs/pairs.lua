return {
  {
    "altermo/npairs-integrate-upair",
    dependencies = {
      "windwp/nvim-autopairs",
      "altermo/ultimate-autopair.nvim",
    },
    config = function()
      require("npairs-int-upair").setup({})
    end,
  },
}
