return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "b0o/SchemaStore.nvim",
      "jose-elias-alvarez/typescript.nvim",
      "simrat39/rust-tools.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = false,
        severity_sort = true,
      },
    },
    config = function(_, opts)
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      require("mason").setup()
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      local mlsp = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      mlsp.setup({
        ensure_installed = {
          "clangd",
          "cssls",
          "gopls",
          "html",
          "jsonls",
          "lua_ls",
          "marksman",
          "pyright",
          "rust_analyzer",
          "svelte",
          "tsserver",
          "taplo",
          "yamlls",
          "zls",
        },
        automatic_installtion = true,
      })

      mlsp.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["jsonls"] = function()
          lspconfig.jsonls.setup({
            on_new_config = function(new_config)
              new_config.settings.json.schemas = new_config.settings.json.schemas or {}
              vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
            end,
            settings = {
              json = {
                format = {
                  enable = true,
                },
                validate = { enable = true },
              },
            },
          })
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            single_file_support = true,
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                completion = {
                  callSnippet = "Replace",
                },
                diagnostics = {
                  enable = true,
                  globals = { "hs", "vim", "it", "describe", "before_each", "after_each" },
                  disable = { "lowercase-global" },
                },
              },
            },
          })
        end,
        ["gopls"] = function()
          lspconfig.gopls.setup({
            capabilities = capabilities,
            settings = {
              gopls = {
                experimentalPostfixCompletions = true,
                analyses = {
                  unusedparams = true,
                  shadow = true,
                },
                staticcheck = true,
              },
            },
            init_options = {
              usePlaceholders = true,
            },
          })
        end,
        ["tsserver"] = function()
          require("typescript").setup({
            server = {
              capabilities = capabilities,
              on_attach = {
                vim.keymap.set(
                  "n",
                  "<leader>co",
                  "<cmd>TypescriptOrganizeImports<CR>",
                  { buffer = buffer, desc = "Organize Imports" }
                ),
                vim.keymap.set(
                  "n",
                  "<leader>cR",
                  "<cmd>TypescriptRenameFile<CR>",
                  { desc = "Rename File", buffer = buffer }
                ),
              },
              settings = {
                typescript = {
                  format = {
                    indentSize = vim.o.shiftwidth,
                    convertTabsToSpaces = vim.o.expandtab,
                    tabSize = vim.o.tabstop,
                  },
                },
                javascript = {
                  format = {
                    indentSize = vim.o.shiftwidth,
                    convertTabsToSpaces = vim.o.expandtab,
                    tabSize = vim.o.tabstop,
                  },
                },
                completions = {
                  completeFunctionCalls = true,
                },
              },
            },
          })
        end,
        ["rust_analyzer"] = function()
          local rt = require("rust-tools")
          rt.setup({
            tools = {
              inlay_hints = {
                auto = true,
                only_current_line = false,
                show_parameter_hints = true,
                parameter_hints_prefix = "<- ",
                other_hints_prefix = "=> ",
                max_len_align = false,
                max_len_align_padding = 1,
                right_align = false,
                right_align_padding = 7,
                highlight = "Comment",
              },
            },
            server = {
              standalone = true,
              on_attach = function(_, bufnr)
                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                vim.keymap.set(
                  "n",
                  "<Leader>ca",
                  rt.code_action_group.code_action_group,
                  { buffer = bufnr }
                )
              end,
              ["rust-analyzer"] = {
                procMacro = { enable = true },
                cargo = { allFeatures = true },
                checkOnSave = {
                  command = "clippy",
                  extraArgs = { "--no-deps" },
                },
              },
            },
          })
        end,
        ["yamlls"] = function()
          lspconfig.yamlls.setup({
            capabilities = capabilities,
            settings = {
              yaml = {
                keyOrdering = false,
              },
            },
          })
        end,
      })
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    keys = {
      { "gh", "<cmd>Lspsaga lsp_finder<CR>",           desc = "Lsp Finder" },
      { "gr", "<cmd>Lspsaga rename<CR>",               desc = "Rename" },
      { "gR", "<cmd>Lspsaga rename ++project<CR>",     desc = "Rename Project" },
      { "gd", "<cmd>Lspsaga peek_definition<CR>",      desc = "Peek Definition" },
      { "gD", "<cmd>Lspsaga goto_definition<CR>",      desc = "Definition" },
      { "gt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek Type Definition" },
      { "gT", "<cmd>Lspsaga goto_type_definition<CR>", desc = "Type Definition" },
      {
        "<leader>ca",
        "<cmd>Lspsaga code_action<CR>",
        mode = { "n", "v" },
        desc = "Code Action",
      },
      { "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>",   desc = "Line Diagnostics" },
      { "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "Cursor Diagnostics" },
      {
        "[E",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
        desc = "Next Error",
      },
      {
        "]E",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
        "Previous Error",
      },
      { "<leader>co", "<cmd>Lspsaga outline<CR>",          desc = "Outline" },
      { "K",          "<cmd>Lspsaga hover_doc ++keep<CR>", desc = "Show Documentation" },
      { "<A-d>",      "<cmd>Lspsaga term_toggle<CR>",      mode = { "n", "t" },        desc = "Floatin term" },
    },
    config = function()
      require("lspsaga").setup({
        preview = {
          lines_above = 0,
          lines_below = 10,
        },
        scroll_preview = {
          scroll_down = "<C-f>",
          scroll_up = "<C-b>",
        },
        request_timeout = 2000,
        ui = {},
        finder = {
          max_height = 0.5,
          min_width = 30,
          force_max_height = false,
          keys = {
            jump_to = "p",
            expand_or_jump = "o",
            vsplit = "s",
            split = "i",
            tabe = "t",
            tabnew = "r",
            quit = { "q", "<ESC>" },
            close_in_preview = "<ESC>",
          },
        },
        definition = {
          edit = "<C-c>o",
          vsplit = "<C-c>v",
          split = "<C-c>i",
          tabe = "<C-c>t",
          quit = "q",
        },
        code_action = {
          num_shortcut = true,
          show_server_name = false,
          extend_gitsigns = true,
          keys = {
            quit = "q",
            exec = "<CR>",
          },
        },
        lightbulb = {
          enable = true,
          enable_in_insert = true,
          sign = true,
          sign_priority = 40,
          virtual_text = false,
        },
        hover = {
          max_width = 0.6,
          open_link = "gx",
          open_browser = "!chrome",
        },
        outline = {
          win_position = "right",
          win_with = "",
          win_width = 30,
          preview_width = 0.4,
          show_detail = true,
          auto_preview = true,
          auto_refresh = true,
          auto_close = true,
          custom_sort = nil,
          keys = {
            expand_or_jump = "o",
            quit = "q",
          },
        },
        symbol_in_winbar = {
          enable = false,
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "stylua",
        "black",
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
