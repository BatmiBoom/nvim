vim.pack.add { 'https://github.com/mason-org/mason.nvim' }

require('mason').setup()

local ensure_installed = {
  -- SERVERS
  'clangd',
  'css-lsp',
  'gopls',
  'html-lsp',
  'json-lsp',
  'basedpyright',
  'rust-analyzer',
  'typescript-language-server',
  'lua-language-server',
  'markdown-oxide',
  'ruff',
  'ols',
  'sqlls',
  'taplo',
  'tailwindcss-language-server',
  'yaml-language-server',
  'zls',
  -- FORMATTERS
  'stylua',
  'prettierd',
  'gofumpt',
  'goimports',
  'golines',
  -- LINTERS
  'biome',
  'golangci-lint',
}

vim.api.nvim_create_user_command('MasonEnsuredInstall', function()
  local cmd = table.concat(ensure_installed, ' ')
  vim.api.nvim_command('MasonInstall ' .. cmd)
end, { desc = 'Install Lsp Server' })
