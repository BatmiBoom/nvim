return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/trouble.nvim" },

      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          { "hrsh7th/cmp-nvim-lsp" },
          { "hrsh7th/cmp-nvim-lua" },
          { "hrsh7th/cmp-buffer" },
          { "hrsh7th/cmp-path" },
          { "hrsh7th/cmp-cmdline" },
          {
            "saadparwaiz1/cmp_luasnip",
            dependencies = {
              "L3MON4D3/LuaSnip",
              -- follow latest release.
              version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
              -- install jsregexp (optional!).
              build = "make install_jsregexp"
            }
          },
          { "onsails/lspkind-nvim" },
          {
            "Saecki/crates.nvim",
            event = { "BufRead Cargo.toml" },
            opts = {
              src = {
                cmp = { enabled = true },
              },
            },
          },
        }
      },

      { "rafamadriz/friendly-snippets" },

      { "folke/neodev.nvim" },

      { "b0o/schemastore.nvim" },
    },
    config = function()
      ------------------------------ START CMP ------------------------------------------
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()
      luasnip.filetype_extend("typescriptreact", { "html" })

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<c-y>"] = cmp.mapping(
            cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            },
            { "i", "c" }
          ),
          ["<M-y>"] = cmp.mapping(
            cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            },
            { "i", "c" }
          ),
          ["<c-space>"] = cmp.mapping {
            i = cmp.mapping.complete(),
            c = function(_)
              if cmp.visible() then
                if not cmp.confirm { select = true } then
                  return
                end
              else
                cmp.complete()
              end
            end,
          },
          ["<tab>"] = cmp.config.disable,
        }),

        sources = cmp.config.sources({
          { name = "nvim_lua" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "crates" },
        }, {
          { name = "path" },
          { name = "buffer", keyword_lenght = 5 },
        }),

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        formatting = {
          format = require("lspkind").cmp_format {
            with_text = true,
            menu = {
              buffer = "[buf]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[api]",
              path = "[path]",
              luasnip = "[snip]",
              gh_issues = "[issues]",
              tn = "[TabNine]",
              eruby = "[erb]",
              cody = "[cody]",
            },
          },
        },

        enabled = function()
          -- disable autocompletion in prompt (wasn't playing good with telescope)
          local buftype = vim.api.nvim_buf_get_option(0, "buftype")
          if buftype == "prompt" then
            return false
          end

          local context = require("cmp.config.context")
          -- disable autocompletion in comments
          return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
        end,

        experimental = {
          native_menu = false,
          ghost_text = false,
        },

        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,

            function(entry1, entry2)
              local _, entry1_under = entry1.completion_item.label:find("^_+")
              local _, entry2_under = entry2.completion_item.label:find("^_+")
              entry1_under = entry1_under or 0
              entry2_under = entry2_under or 0
              if entry1_under > entry2_under then
                return false
              elseif entry1_under < entry2_under then
                return true
              end
            end,

            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      })

      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
          { name = "path", max_item_count = 5 },
        }, {
          { name = "cmdline", max_item_count = 5 },
        }),
      })
      ------------------------------ END CMP ------------------------------------------
      ------------------------------ START LSP ----------------------------------------
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

      vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
      capabilities.textDocument.completion.completionItem.insertReplaceSupport = false
      capabilities.textDocument.codeLens = { dynamicRegistration = false }

      local lsp_installed = {
        "astro",
        "cssls",
        -- "clangd",
        "cmake",
        "dockerls",
        "elixirls",
        -- "gopls",
        "html",
        "htmx",
        -- "jsonls",
        -- "lua_ls",
        "marksman",
        "neocmake",
        "ocamllsp",
        -- "pyright",
        "ruff_lsp",
        -- "rust_analyzer",
        "sqlls",
        "svelte",
        "tailwindcss",
        "taplo",
        -- "tsserver",
        -- "yamlls",
        "zls",
      }

      require("neodev").setup({})

      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      require("lspconfig").pyright.setup({
        capabilities = capabilities,
      })

      require("lspconfig").ols.setup({})

      require("lspconfig").clangd.setup({
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--suggest-missing-includes",
          "--clang-tidy",
          "--header-insertion=iwyu",
        },
        init_options = {
          clangFileStatus = true,
        },
        filetypes = {
          "c",
        }
      })

      require("lspconfig").jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      require("lspconfig").yamlls.setup({
        capabilities = capabilities,
        settings = {
          yaml = {
            -- schemas = {
            --   ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            --   ["../path/relative/to/file.yml"] = "/.github/workflows/*",
            --   ["/path/from/root/of/project"] = "/.github/workflows/*",
            -- },
          },
        },
      })

      for _, lsp in pairs(lsp_installed) do
        require("lspconfig")[lsp].setup({
          capabilities = capabilities,
        })
      end

      ------------------------------ END LSP ------------------------------------------
      ------------------------------ START DIAG -----------------------------------------------

      local default_diagnostic_config = {
        underline = true,
        virtual_text = {
          severity = nil,
          source = "if_many",
          format = nil
        },
        signs = true,
        float = {
          show_header = true,
          -- border = "rounded",
          -- source = "always",
          format = function(d)
            if not d.code and not d.user_data then
              return d.message
            end

            local t = vim.deepcopy(d)
            local code = d.code
            if not code then
              if not d.user_data.lsp then
                return d.message
              end

              code = d.user_data.lsp.code
            end
            if code then
              t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
            end
            return t.message
          end,
        },
        update_in_insert = false,
        severity_sort = true,
      }

      vim.diagnostic.config(default_diagnostic_config)

      ------------------------------ END DIAG -----------------------------------------------
    end,
  },

  -- TYPESCRIPT
  {
    "pmizio/typescript-tools.nvim",
    event = { "BufReadPost *.js", "BufReadPost *.jsx", "BufReadPost *.ts", "BufReadPost *.tsx" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- RUST
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = { "BufReadPost *.rs" },
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover action
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>cag", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end,
  },
  {
    "ray-x/go.nvim",
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
    dependencies = {
      "ray-x/guihua.lua",
    },
    config = function()
      require("go").setup {
        verbose = false, -- output loginf in messages

        -- true: will use go.nvim on_attach if true
        -- nil/false do nothing
        -- lsp_diag_hdlr = true, -- hook lsp diag handler
        dap_debug = true,         -- set to true to enable dap
        dap_debug_keymap = false, -- set keymaps for debugger
        dap_debug_gui = true,     -- set to true to enable dap gui, highly recommand
        dap_debug_vt = true,      -- set to true to enable dap virtual text

        -- TODO: Test these out.
        -- goimport = "gofumports", -- goimport command
        -- gofmt = "gofumpt", --gofmt cmd,
        -- max_line_len = 120, -- max line length in goline format
        -- tag_transform = false, -- tag_transfer  check gomodifytags for details
        -- test_template = "", -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
        -- test_template_dir = "", -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
        -- comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. ﳑ       

        -- Disable everything for LSP
        lsp_cfg = true,        -- true: apply go.nvim non-default gopls setup
        lsp_gofumpt = true,    -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = false, -- if a on_attach function provided:  attach on_attach function to gopls
        gopls_cmd = nil,       -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile", "/var/log/gopls.log" }

      }
    end
  },
  {
    "ray-x/lsp_signature.nvim", -- show hints when writing function arguments
    event = { "InsertEnter" },
    opts = {
      bind = true,
      noice = true,
      max_height = 20,
      zindex = 1,
      always_trigger = true,
      floating_window_above_cur_line = true,
      floating_window_off_x = function(info)
        local cur_pos = vim.api.nvim_win_get_cursor(0)[2] + 1
        local x_off = info.x_off or -vim.trim(vim.api.nvim_get_current_line():sub(1, cur_pos)):len()
        local win_width = vim.api.nvim_win_get_width(0) - 4
        local origin = math.min(120, win_width)
        return origin - x_off - cur_pos
      end,
      extra_trigger_chars = { "(", ",", "\n" },
    },
  },

  -- PYTHON
  {
    "stevanmilic/nvim-lspimport",
    ft = { "python" },
  },
  {
    "AckslD/swenv.nvim",
    config = function()
      require("swenv").setup({
        get_venvs = function(venvs_path)
          return require("swenv.api").get_venvs(venvs_path)
        end,
        venvs_path = "/Users/batmi/Library/Caches/pypoetry/virtualenvs/",
        post_set_venv = function()
          vim.cmd("LspRestart")
        end,
      })
    end,
    keys = {
      {
        "<leader>pv",
        mode = { "n" },
        function()
          require("swenv.api").pick_venv()
        end,
        desc = "Select Python Env",
      },
    },
  },
}
