return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'lukas-reineke/cmp-rg',
    'SergioRibera/cmp-dotenv',
    'onsails/lspkind-nvim',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },
      formatting = {
        format = require('lspkind').cmp_format {
          with_text = true,
          menu = {
            buffer = '[buf]',
            nvim_lsp = '[LSP]',
            nvim_lua = '[api]',
            path = '[path]',
            luasnip = '[snip]',
            gh_issues = '[issues]',
            tn = '[TabNine]',
            eruby = '[erb]',
            cody = '[cody]',
          },
        },
      },

      -- enabled = function()
      --   local buftype = vim.api.nvim_get_option_value('buftype', { buf = 0 })
      --   if buftype == 'prompt' then
      --     return false
      --   end
      --
      --   local context = require 'cmp.config.context'
      --   return not context.in_treesitter_capture 'comment' and not context.in_syntax_group 'Comment'
      -- end,
      sources = {
        { name = 'nvim_lsp' },
        { name = 'rg', keyword_lenght = 3 },
        { name = 'nvim_lsp_signature_help', keyword_lenght = 3 },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'dotenv' },
      },
    }
  end,
}
