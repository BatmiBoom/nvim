return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      return {
        timeout_ms = 500,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_fix', 'ruff_format' },
      javascript = { 'biome' },
      typescript = { 'biome' },
      javascriptreact = { 'biome' },
      typescriptreact = { 'biome' },
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
