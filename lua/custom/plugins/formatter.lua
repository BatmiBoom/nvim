return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  opts = {
    notify_on_error = false,
    format_on_save = function()
      return {
        timeout_ms = 500,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_fix', 'ruff_format' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      json = { 'prettierd' },
      svelte = { 'prettierd' },
      yaml = { 'prettierd' },
      graphql = { 'prettierd' },
      markdown = { 'prettierd' },
    },
  },
}
