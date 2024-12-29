return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'normal',
    },
    completion = {
      ghost_text = {
        enabled = true,
      },
    },
    signature = {
      enabled = true,
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { 'sources.default' },
}
