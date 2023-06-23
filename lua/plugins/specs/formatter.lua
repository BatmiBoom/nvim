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
          nls.builtins.formatting.eslint_d,
          nls.builtins.formatting.elm_format,
          nls.builtins.diagnostics.eslint_d,
          nls.builtins.code_actions.eslint_d,
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
