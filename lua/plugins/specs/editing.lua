return {
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w",  "<cmd>lua require('spider').motion('w')<CR>",  mode = { "n", "o", "x" }, desc = "Spider-w" },
      { "e",  "<cmd>lua require('spider').motion('e')<CR>",  mode = { "n", "o", "x" }, desc = "Spider-w" },
      { "b",  "<cmd>lua require('spider').motion('b')<CR>",  mode = { "n", "o", "x" }, desc = "Spider-b" },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" }, desc = "Spider-ge" },
    },
  },
  {
    "ggandor/flit.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs({ "f", "F", "t", "T" }) do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
  {
    "ggandor/leap.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
