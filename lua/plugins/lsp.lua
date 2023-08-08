return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "petertriho/cmp-git" },
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      local cmp = require("cmp")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-x>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", group_index = 1, max_item_count = 20 },
          { name = "nvim_lua", group_index = 1, max_item_count = 5 },
          { name = "luasnip",  group_index = 2, max_item_count = 5 },
        }, {
          { name = "buffer", group_index = 3, keyword_lenght = 5, max_item_count = 5 },
        }),
        enabled = function()
          -- disable completion in comments
          local context = require 'cmp.config.context'
          -- keep command mode completion enabled when cursor is in a comment
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
          end
        end
      })

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git", max_item_count = 5 },
        }, {
          { name = "buffer", max_item_count = 5 },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer", max_item_count = 5 },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path", max_item_count = 5 },
        }, {
          { name = "cmdline", max_item_count = 5 },
        }),
      })

      local lsp_installed = {
        "cssls",
        "clangd",
        "gopls",
        "html",
        "jsonls",
        -- "lua_ls",
        "marksman",
        "ols",
        -- "pyright",
        -- "rust_analyzer",
        "sqlls",
        "tailwindcss",
        "taplo",
        -- "tsserver",
        "zls"
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require 'lspconfig'.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      require 'lspconfig'.pyright.setup {
        capabilities = capabilities
      }

      for _, lsp in pairs(lsp_installed) do
        require("lspconfig")[lsp].setup({
          capabilities = capabilities,
        })
      end
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    'simrat39/rust-tools.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    event = { "BufReadPost *.rs" },
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end
  }
}
