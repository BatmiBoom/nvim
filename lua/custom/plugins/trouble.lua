return {
  'folke/trouble.nvim',
  opts = {
    auto_close = false, -- auto close when there are no items
    auto_open = false, -- auto open when there are items
    auto_preview = true, -- automatically open preview when on an item
    auto_refresh = true, -- auto refresh when open
    auto_jump = false, -- auto jump to the item when there's only one
    focus = false, -- Focus the window when opened
    restore = true, -- restores the last location in the list when opening
    follow = true, -- Follow the current item
    indent_guides = true, -- show indent guides
    max_items = 200, -- limit number of items that can be displayed per section
    multiline = true, -- render multi-line messages
    pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
    warn_no_results = true, -- show a warning when there are no results
    open_no_results = false, -- open the trouble window when there are no results
    win = {},
    preview = {
      type = 'main',
      -- when a buffer is not yet loaded, the preview window will be created
      -- in a scratch buffer with only syntax highlighting enabled.
      -- Set to false, if you want the preview to always be a real loaded buffer.
      scratch = true,
    },
    keys = {
      ['?'] = 'help',
      r = 'refresh',
      R = 'toggle_refresh',
      q = 'close',
      o = 'jump_close',
      ['<esc>'] = 'cancel',
      ['<cr>'] = 'jump',
      ['<2-leftmouse>'] = 'jump',
      ['<c-s>'] = 'jump_split',
      ['<c-v>'] = 'jump_vsplit',
      -- go down to next item (accepts count)
      j = 'next',
      ['}'] = 'next',
      [']]'] = 'next',
      -- go up to prev item (accepts count)
      k = 'prev',
      ['{'] = 'prev',
      ['[['] = 'prev',
      dd = 'delete',
      d = { action = 'delete', mode = 'v' },
      i = 'inspect',
      p = 'preview',
      P = 'toggle_preview',
      zo = 'fold_open',
      zO = 'fold_open_recursive',
      zc = 'fold_close',
      zC = 'fold_close_recursive',
      za = 'fold_toggle',
      zA = 'fold_toggle_recursive',
      zm = 'fold_more',
      zM = 'fold_close_all',
      zr = 'fold_reduce',
      zR = 'fold_open_all',
      zx = 'fold_update',
      zX = 'fold_update_all',
      zn = 'fold_disable',
      zN = 'fold_enable',
      zi = 'fold_toggle_enable',
      gb = { -- example of a custom action that toggles the active view filter
        action = function(view)
          view:filter({ buf = 0 }, { toggle = true })
        end,
        desc = 'Toggle Current Buffer Filter',
      },
      s = { -- example of a custom action that toggles the severity
        action = function(view)
          local f = view:get_filter 'severity'
          local severity = ((f and f.filter.severity or 0) + 1) % 5
          view:filter({ severity = severity }, {
            id = 'severity',
            template = '{hl:Title}Filter:{hl} {severity}',
            del = severity == 0,
          })
        end,
        desc = 'Toggle Severity Filter',
      },
    },
    modes = {
      -- sources define their own modes, which you can use directly, or override like in the example below
      lsp_references = {
        params = {
          include_declaration = true,
        },
      },
      -- The LSP base mode for:
      -- * lsp_definitions, lsp_references, lsp_implementations
      -- * lsp_type_definitions, lsp_declarations, lsp_command
      lsp_base = {
        params = {
          include_current = false,
        },
      },
      symbols = {
        desc = 'document symbols',
        mode = 'lsp_document_symbols',
        focus = false,
        win = { position = 'right' },
        filter = {
          ['not'] = { ft = 'lua', kind = 'Package' },
          any = {
            ft = { 'help', 'markdown' },
            kind = {
              'Class',
              'Constructor',
              'Enum',
              'Field',
              'Function',
              'Interface',
              'Method',
              'Module',
              'Namespace',
              'Package',
              'Property',
              'Struct',
              'Trait',
            },
          },
        },
      },
    },
    icons = {
      indent = {
        top = '│ ',
        middle = '├╴',
        last = '└╴',
        fold_open = ' ',
        fold_closed = ' ',
        ws = '  ',
      },
      folder_closed = ' ',
      folder_open = ' ',
      kinds = {
        Array = ' ',
        Boolean = '󰨙 ',
        Class = ' ',
        Constant = '󰏿 ',
        Constructor = ' ',
        Enum = ' ',
        EnumMember = ' ',
        Event = ' ',
        Field = ' ',
        File = ' ',
        Function = '󰊕 ',
        Interface = ' ',
        Key = ' ',
        Method = '󰊕 ',
        Module = ' ',
        Namespace = '󰦮 ',
        Null = ' ',
        Number = '󰎠 ',
        Object = ' ',
        Operator = ' ',
        Package = ' ',
        Property = ' ',
        String = ' ',
        Struct = '󰆼 ',
        TypeParameter = ' ',
        Variable = '󰀫 ',
      },
    },
  },
  cmd = 'Trouble',
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>cr',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>qq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
}
