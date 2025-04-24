return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
      'ibhagwan/fzf-lua',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
          map('gi', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
          map('gy', require('fzf-lua').lsp_typedefs, 'Type [D]efinition')
          map('<leader>d', require('fzf-lua').diagnostics_document, '[D]ocuments [D]iagnostics')
          map('<leader>D', require('fzf-lua').diagnostics_workspace, '[W]orkspace [D]iagnostics')
          map('<leader>s', require('fzf-lua').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>S', require('fzf-lua').lsp_live_workspace_symbols, '[W]orkspace [S]ymbols')

          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          map('<leader>r', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>a', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          map('<leader>k', vim.lsp.buf.signature_help, '[S]ignature [H]elp')

          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = {
        clangd = {
          init_options = { clangdFileStatus = true },
          filetypes = { 'c' },
        },
        cssls = {},
        gopls = {},
        html = {},
        jsonls = {},
        pyright = {},
        rust_analyzer = {},
        ts_ls = {},
        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        markdown_oxide = {},
        ols = {},
        sqlls = {},
        taplo = {},
        tailwindcss = {},
        yamlls = {},
        zls = {},
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        -- FORMATTERS
        'stylua',
        'prettierd',
        'gofumpt',
        'goimports',
        'golines',
        -- LINTERS
        'biome',
        'ruff',
        'golangci-lint',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      local lsp_config = require 'lspconfig'

      require('mason-lspconfig').setup {
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }

      -- Servers that are not in mason
      lsp_config.gleam.setup {
        capabilities = capabilities,
      }
      lsp_config.ocamllsp.setup {
        capabilities = capabilities,
      }
      lsp_config.lexical.setup {
        filetypes = { 'elixir', 'eelixir', 'heex' },
        cmd = { '~/programs/lexical/bin/start_lexical.sh' },
        capabilities = capabilities,
        settings = {},
      }
    end,
  },
}
