vim.opt_local.commentstring = '-- %s'

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
