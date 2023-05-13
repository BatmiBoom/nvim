return {
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "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",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>pg", "<cmd>ChatGPT<CR>", desc = "Open ChatGPT prompt" },
    },
  },
}
