return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'echasnovski/mini.icons',
  },
  version = '*',
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'normal',
    },
    completion = {
      menu = {
        border = 'single',
        draw = {
          treesitter = { 'lsp' },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                return kind_icon
              end,
            },
            kind = {
              text = function(ctx)
                return '<' .. ctx.kind .. '>'
              end,
            },
          },
          columns = {
            { 'kind_icon', gap = 1 },
            { 'label', 'label_description', gap = 1 },
            { 'kind', gap = 1 },
          },
        },
      },
      list = {
        selection = { preselect = false, auto_insert = true },
      },
    },
    signature = {
      window = {
        border = 'single',
      },
      enabled = true,
    },
    sources = {
      default = function(ctx)
        local success, node = pcall(vim.treesitter.get_node)
        if vim.bo.filetype == 'markdown' then
          return { 'lsp', 'path', 'snippets', 'buffer' }
        elseif success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
          return { 'buffer' }
        else
          return { 'lsp', 'path', 'snippets' }
        end
      end,
    },
  },
  opts_extend = { 'sources.default' },
}
