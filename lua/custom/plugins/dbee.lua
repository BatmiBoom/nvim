return {
  {
    'kndndrj/nvim-dbee',
    dependencies = { 'MunifTanjim/nui.nvim' },
    build = function()
      require('dbee').install()
    end,
    config = function()
      require('dbee').setup {}
    end,
    keys = {
      {
        '<space>oo',
        function()
          require('dbee').open()
        end,
      },
      {
        '<space>oc',
        function()
          require('dbee').close()
        end,
      },
    },
  },
}
