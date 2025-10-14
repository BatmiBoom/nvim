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

---@param url string
---@return string
M.extract_repo_name = function(url)
  local path = url:match 'github%.com/[^/]+/([^/]+)' or url:match '/([^/]+)$'
  return path:gsub('%.git$', '') -- Remove .git suffix if present
end

return M
