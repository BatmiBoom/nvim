return {
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = 'doom',
        config = {
          header = {
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
            ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
            ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
            ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
            ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
            ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
          }, --your header
          center = {
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Find File           ',
              desc_hl = 'String',
              key = 'f',
              keymap = 'SPC SPC',
              key_hl = 'Number',
              action = 'Telescope find_files'
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Live Grep           ',
              desc_hl = 'String',
              key = 'g',
              keymap = 'SPC fg',
              key_hl = 'Number',
              action = 'Telescope live_grep'
            },
            {
              icon = ' ',
              desc = 'Restore Session',
              key = 's',
              keymap = 'SPC q s',
              action = 'lua require("persistence").load()'
            },
          },
          footer = {
            "I would love to fly"
          } --your footer
        },
        hide = {
          statusline = true,
          tabline = true,
          winbar = true,
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
