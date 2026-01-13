-- vim.lsp.config('pyrefly', {
--   root_markers = { '.git', 'pyproject.toml', 'setup.py', 'requirements.txt' },
-- })

vim.lsp.config('lua_ls', {
  root_markers = { '.git', '.luarc.json', '.stylua.toml' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        },
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable {
  'clangd',
  'cssls',
  'gopls',
  'html',
  'jsonls',
  'lua_ls',
  'markdown_oxide',
  'ols',
  -- 'pyrefly',
  'basedpyright',
  'rust_analyzer',
  'sqlls',
  'taplo',
  'ts_ls',
  'tailwindcss',
  'yamlls',
  'zls',
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LSP', { clear = true }),
  desc = 'Attach some keybidings when a lsp is attached',
  callback = function()
    vim.keymap.set('n', 'gd', function()
      vim.lsp.buf.definition()
    end, { desc = 'Go To Definition' })
  end,
})
