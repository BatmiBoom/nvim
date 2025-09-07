vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1.6.0' },
}

require('blink.cmp').setup {
  keymap = {
    preset = 'default',
  },
  completion = {
    menu = {
      draw = {
        columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
        components = {
          kind_icon = {
            text = function(ctx)
              local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
              return kind_icon
            end,
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
          kind = {
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
        },
      },
    },
    documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = 'single' } },
  },
  sources = {
    default = { 'lsp', 'path', 'buffer' },
  },
  appearance = {
    highlight_ns = vim.api.nvim_create_namespace 'blink_cmp',
    nerd_font_variant = 'normal',
  },
  fuzzy = { implementation = 'prefer_rust_with_warning', sorts = { 'exact', 'score', 'sort_text' } },
  signature = { enabled = true },
}
