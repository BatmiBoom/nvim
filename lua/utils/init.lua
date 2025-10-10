local M = {}

---@param s string
---@param sep string
---@return string[]
M.split = function(s, sep)
  local t = {}
  for str in string.gmatch(s, '([^' .. sep .. ']+)') do
    table.insert(t, str)
  end

  return t
end

return M
