return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require('conform').setup {
      notify_on_error = true,
      formatters_by_ft = {
        lua = { 'stylua' },
        ocaml = { 'ocamlformat' },
        python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
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
        gleam = { 'gleam' },
        go = { 'gofumpt', 'goimports', 'golines' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = function(_)
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,
    }
  end,
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
