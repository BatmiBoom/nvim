vim.lsp.enable {
  'clangd',
  'cssls',
  'gopls',
  'html',
  'jsonls',
  'lua_ls',
  'markdown_oxide',
  'ols',
  'ruff',
  'pyrefly',
  'rust_analyzer',
  'sqlls',
  'taplo',
  'ts_ls',
  'tailwindcss',
  'yamlls',
  'zls',
}

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LSP', { clear = true }),
  desc = 'Attach some keybidings when a lsp is attached',
  callback = function()
    vim.keymap.set('n', 'gd', function()
      vim.lsp.buf.definition()
    end, { desc = 'Go To Definition' })
  end,
})
