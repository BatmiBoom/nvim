return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      python = { 'ruff' },
      javascript = { 'biomejs' },
      typescript = { 'biomejs' },
      javascriptreact = { 'biomejs' },
      typescriptreact = { 'biomejs' },
      golang = { 'golangcilint' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
