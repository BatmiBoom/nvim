return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'saghen/blink.cmp',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'williamboman/mason.nvim', config = true },
      { 'nvim-telescope/telescope.nvim' },

      'b0o/SchemaStore.nvim',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- TELESCOPE
          local telescope = require 'telescope.builtin'
          map('gd', function()
            telescope.lsp_definitions { jump_type = 'tab', reuse_win = true }
          end, '[G]oto Definition')
          map('gtd', function()
            telescope.lsp_type_definitions { jump_type = 'tab', reuse_win = true }
          end, '[G]oto Type Definition')
          map('gr', function()
            telescope.lsp_references { jump_type = 'tab' }
          end, '[G]oto References & Implementation')
          map('gds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
          map('gws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace Symbols')
          -- BUILTINT
          map('gs', vim.lsp.buf.signature_help, '[S]ignature [H]elp')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, 0) then
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
        jsonls = {
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
            },
          },
        },
        pyright = {},
        -- rust_analyzer = {},
        ts_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
        markdown_oxide = {},
        ols = {},
        sqlls = {},
        taplo = {},
        tailwindcss = {},
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = '',
              },
              schemas = require('schemastore').yaml.schemas(),
            },
          },
        },
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

      require('mason').setup()
      require('mason-lspconfig').setup()
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      local lsp_config = require 'lspconfig'
      -- Mason Installed Servers
      for name, opts in pairs(servers) do
        lsp_config[name].setup {
          cmd = opts.cmd,
          init_options = opts.init_options,
          settings = opts.settings,
          filetypes = opts.filetypes,
          capabilities = capabilities,
        }
      end

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
