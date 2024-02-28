return {
  'ray-x/go.nvim',
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()',
  dependencies = {
    'ray-x/guihua.lua',
  },
  config = function()
    require('go').setup {
      lsp_cfg = true, -- false: use your own lspconfig
      lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
      lsp_on_attach = true, -- use on_attach from go.nvim
      lsp_diag_hdlr = true, -- hook lsp diag handler

      goimport = 'gofumports', -- goimport command
      gofmt = 'gofumpt', --gofmt cmd,

      max_line_len = 120,
      tag_transform = false,
      test_dir = '',
      comment_placeholder = '   ',
      verbose = false, -- output loginf in messages

      dap_debug = true, -- set to true to enable dap
      dap_debug_keymap = false, -- set keymaps for debugger
      dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
      dap_debug_vt = true, -- set to true to enable dap virtual text
    }
  end,
}
