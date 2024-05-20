return {
  {
    'kndndrj/nvim-dbee',
    dependencies = { 'MunifTanjim/nui.nvim' },
    build = function()
      require('dbee').install()
    end,
    config = function()
      require('dbee').setup {
        sources = {
          -- require('dbee.sources').MemorySource:new { -- LOAD FROM MEMORY
          --   {
          --     name = '...',
          --     type = '...',
          --     url = '...',
          --   },
          --   -- ...
          -- },
          -- require('dbee.sources').EnvSource:new 'DBEE_CONNECTIONS', -- LOAD FROM ENV VARIABLES
          require('dbee.sources').FileSource:new(vim.fn.stdpath 'cache' .. '/dbee/persistence.json'), -- LOAD FROM JSON FILE
        },
      }

      ---@diagnostic disable-next-line: param-type-mismatch
      local base = vim.fs.joinpath(vim.fn.stdpath 'state', 'dbee', 'notes')
      local pattern = string.format('%s/.*', base)
      vim.filetype.add {
        extension = {
          sql = function(path, _)
            if path:match(pattern) then
              return 'sql.dbee'
            end

            return 'sql'
          end,
        },

        pattern = {
          [pattern] = 'sql.dbee',
        },
      }
    end,
    keys = {
      {
        '<space>od',
        function()
          require('dbee').open()
        end,
      },
    },
  },
}
