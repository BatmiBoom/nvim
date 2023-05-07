return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.black,
          require("typescript.extensions.null-ls.code-actions"),
        },
      }
    end,
    keys = {
        { "<leader>cf",
          function ()
            vim.lsp.buf.format({ async = true})
          end,
          desc = "Format"
        },
    },
  }
}
