return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'williamboman/mason.nvim', config = true },
      { 'j-hui/fidget.nvim', opts = {} },
      { 'ibhagwan/fzf-lua' },

      'b0o/SchemaStore.nvim',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          local fzf_lua = require 'fzf-lua'
          map('gd', fzf_lua.lsp_definitions, '[G]oto [D]efinition')
          map('gr', fzf_lua.lsp_references, '[G]oto [R]eferences')
          map('gI', fzf_lua.lsp_implementations, '[G]oto [I]mplementation')
          map('gs', vim.lsp.buf.signature_help, '[S]ignature [H]elp')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gtd', fzf_lua.lsp_typedefs, 'Type [D]efinition')
          map('gds', fzf_lua.lsp_document_symbols, '[D]ocument [S]ymbols')
          map('gws', fzf_lua.lsp_live_workspace_symbols, '[W]orkspace [S]ymbols')
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('gk', vim.lsp.buf.hover, 'Hover Documentation')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function()
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event.buf }
            end,
          })
        end,
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      capabilities.textDocument.completion.completionItem = {
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        documentationFormat = {
          'markdown',
          'plaintext',
        },
        tagSupport = {
          valueSet = { 1 },
        },
        resolveSupport = {
          properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
          },
        },
      }

      capabilities.workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      }

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
        -- tsserver = {},
        lua_ls = {
          -- cmd = {...},
          -- filetypes { ...},
          -- capabilities = {},
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
        -- ruff_lsp = {},
        sqlls = {},
        taplo = {},
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
        -- LINTERS
        'biome',
        'ruff',
        -- LSP
      })

      require('mason').setup()
      require('mason-lspconfig').setup()
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      for name, opts in pairs(servers) do
        require('lspconfig')[name].setup {
          cmd = opts.cmd,
          init_options = opts.init_options,
          settings = opts.settings,
          filetypes = opts.filetypes,
          capabilities = vim.tbl_deep_extend('force', {}, capabilities, opts.capabilities or {}),
        }
      end
    end,
  },
}
