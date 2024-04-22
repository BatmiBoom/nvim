return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  version = false,
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
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'SergioRibera/cmp-dotenv',
    'onsails/lspkind-nvim',
  },
  config = function()
    local cmp = require 'cmp'
    local defaults = require 'cmp.config.default'()
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      enabled = function()
        return vim.g.cmptoggle
      end,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-e>'] = cmp.mapping.confirm { select = true },
        ['<C-y>'] = cmp.mapping.abort(),
        ['<C-x>'] = cmp.mapping.complete {},
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
        expandable_indicator = false,
        fields = { 'kind', 'abbr', 'menu' },
        format = require('lspkind').cmp_format {
          with_text = false,
          menu = {
            nvim_lsp = '[LSP]',
            nvim_lua = '[NVIM_API]',
            path = '[PATH]',
            buffer = '[BUF]',
            luasnip = '[SNIP]',
            dotenv = '[ENV]',
          },
        },
      },
      sources = {
        { name = 'path' },
        {
          name = 'nvim_lsp',
          keyword_lenght = 1,
          option = {
            markdown_oxide = {
              keyword_pattern = [[\(\k| \|\/|#\)\+]],
            },
          },
        },
        { name = 'buffer', keyword_length = 3 },
        { name = 'luasnip', keyword_length = 4 },
        { name = 'dotenv', keyword_length = 4 },
      },
      experimental = {
        ghost_text = false,
        native_menu = false,
      },
      sorting = defaults.sorting,
    }

    vim.keymap.set('n', '<leader>ua', '<CMD>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>')
  end,
}
