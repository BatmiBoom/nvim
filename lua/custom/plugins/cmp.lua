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

    'onsails/lspkind-nvim',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'SergioRibera/cmp-dotenv',

    {
      'Exafunction/codeium.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
      config = function()
        require('codeium').setup {}
      end,
    },
  },
  config = function()
    local cmp = require 'cmp'
    local defaults = require 'cmp.config.default'()
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
    vim.opt.shortmess:append 'c'

    local lspkind = require 'lspkind'
    lspkind.init {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-e>'] = cmp.mapping.confirm { select = true },
        ['<C-x>'] = cmp.mapping.abort(),
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
      sources = cmp.config.sources({
        {
          name = 'nvim_lsp',
          group_index = 0,
          option = {
            markdown_oxide = {
              keyword_pattern = [[\(\k| \|\/|#\)\+]],
            },
          },
        },
        {
          name = 'lazydev',
          group_index = 0,
        },
        { name = 'codeium' },
        { name = 'path' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer', keyword_length = 3 },
        { name = 'dotenv', keyword_length = 4 },
      }),
      experimental = {
        ghost_text = false,
        native_menu = false,
      },
      sorting = defaults.sorting,
    }

    luasnip.config.set_config {
      history = false,
      updateevents = 'TextChanged,TextChangedI',
    }

    for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/custom/snippets/*.lua', true)) do
      loadfile(ft_path)()
    end
  end,
}
