local M = {}

local parser_path = '~/.config/nvim/parser/'
local queries_path = '~/.config/nvim/queries/'
local get_path_to_d_parser = function(parser_name)
  return string.format('%s/%s-parser', parser_path, parser_name)
end

M.parsers = {
  {
    name = 'bash',
    url = 'https://github.com/tree-sitter/tree-sitter-bash',
    filetype = 'sh',
  },
  {
    name = 'cmake',
    url = 'https://github.com/uyha/tree-sitter-cmake',
    filetype = 'cmake',
  },
  {
    name = 'cpp',
    url = 'https://github.com/tree-sitter/tree-sitter-cpp',
    filetype = 'cpp',
  },
  {
    name = 'css',
    url = 'https://github.com/tree-sitter/tree-sitter-css',
    filetype = 'css',
  },
  {
    name = 'diff',
    url = 'https://github.com/the-mikedavis/tree-sitter-diff',
    filetype = 'diff',
  },
  {
    name = 'gitignore',
    url = 'https://github.com/shunsambongi/tree-sitter-gitignore',
    filetype = 'gitignore',
  },
  {
    name = 'gleam',
    url = 'https://github.com/gleam-lang/tree-sitter-gleam',
    filetype = 'gleam',
  },
  {
    name = 'go',
    url = 'https://github.com/tree-sitter/tree-sitter-go',
    filetype = 'go',
  },
  {
    name = 'html',
    url = 'https://github.com/tree-sitter/tree-sitter-html',
    filetype = 'html',
  },
  {
    name = 'javascript',
    url = 'https://github.com/tree-sitter/tree-sitter-javascript',
    filetype = 'javascript',
  },
  {
    name = 'json',
    url = 'https://github.com/tree-sitter/tree-sitter-json',
    filetype = 'json',
  },
  {
    name = 'markdown_inline',
    url = 'https://github.com/MDeiml/tree-sitter-markdown',
    filetype = 'markdown',
  },
  {
    name = 'odin',
    url = 'https://github.com/amaanq/tree-sitter-odin',
    filetype = 'odin',
  },
  {
    name = 'python',
    url = 'https://github.com/tree-sitter/tree-sitter-python',
    filetype = 'python',
  },
  {
    name = 'query',
    url = 'https://github.com/tree-sitter-grammars/tree-sitter-query',
    filetype = 'query',
  },
  {
    name = 'regex',
    url = 'https://github.com/tree-sitter/tree-sitter-regex',
    filetype = 'regex',
  },
  {
    name = 'rust',
    url = 'https://github.com/tree-sitter/tree-sitter-rust',
    filetype = 'rust',
  },
  {
    name = 'sql',
    url = 'https://github.com/derekstride/tree-sitter-sql',
    filetype = 'sql',
  },
  {
    name = 'toml',
    url = 'https://github.com/tree-sitter-grammars/tree-sitter-toml',
    filetype = 'toml',
  },
  {
    name = 'typescript',
    url = 'https://github.com/tree-sitter/tree-sitter-typescript',
    filetype = 'typescript',
  },
  {
    name = 'zig',
    url = 'https://github.com/tree-sitter-grammars/tree-sitter-zig',
    filetype = 'zig',
  },
}

-- Download Parsers in folder ~/.config/nvim/parser
---@param parser_info table
---@return boolean?
M.download_parsers = function(parser_info)
  local cmd = string.format(
    'git clone %s %s/%s-parser',
    parser_info.url,
    parser_path,
    parser_info.name
  )
  local success, _, _ = os.execute(cmd)

  return success
end

-- Build the parsers
---@param parser_info table
---@return boolean?
M.build_parsers = function(parser_info)
  if parser_info.name == 'typescript' then
    local _, _, _ = os.execute(
      'cd ' .. get_path_to_d_parser(parser_info.name) .. ' && npm install'
    )

    local success_ts, _, _ = os.execute(
      'cd '
        .. get_path_to_d_parser(parser_info.name)
        .. '/typescript && tree-sitter generate && tree-sitter build'
    )

    local success_tsx, _, _ = os.execute(
      'cd '
        .. get_path_to_d_parser(parser_info.name)
        .. '/tsx && tree-sitter generate && tree-sitter build'
    )

    return success_ts and success_ts or success_tsx
  end

  if parser_info.name == 'markdown_inline' then
    local _, _, _ = os.execute(
      'cd ' .. get_path_to_d_parser(parser_info.name) .. ' && npm install'
    )

    local success_mk, _, _ = os.execute(
      'cd '
        .. get_path_to_d_parser(parser_info.name)
        .. '/tree-sitter-markdown-inline && tree-sitter generate && tree-sitter build'
    )

    return success_mk
  end

  local cmd = string.format(
    'cd %s && npm install && tree-sitter generate && tree-sitter build',
    get_path_to_d_parser(parser_info.name)
  )
  local success, _, _ = os.execute(cmd)
  return success
end

-- Move Builded Parser
---@param parser_info table
---@return boolean?
M.move_parsers = function(parser_info)
  if parser_info.name == 'typescript' then
    local success_ts, _, _ = os.execute(
      'cd '
        .. get_path_to_d_parser(parser_info.name)
        .. ' && mv typescript/parser.so '
        .. parser_path
        .. parser_info.name
        .. '.so'
    )

    local success_tsx, _, _ = os.execute(
      'cd '
        .. get_path_to_d_parser(parser_info.name)
        .. ' && mv tsx/parser.so '
        .. parser_path
        .. 'tsx.so'
    )

    return success_ts and success_ts or success_tsx
  end

  if parser_info.name == 'markdown_inline' then
    local success_mk, _, _ = os.execute(
      'cd '
        .. get_path_to_d_parser(parser_info.name)
        .. ' && mv tree-sitter-markdown-inline/markdown-inline.so '
        .. parser_path
        .. parser_info.name
        .. '.so'
    )

    return success_mk
  end

  local success, _, _ = os.execute(
    'cd '
      .. get_path_to_d_parser(parser_info.name)
      .. ' && mv parser.so '
      .. parser_path
      .. parser_info.name
      .. '.so'
  )
  return success
end

-- Move Builded Parser
---@param parser_info table
---@return boolean?
M.move_queries = function(parser_info)
  if parser_info.name == 'markdown_inline' then
    os.execute(
      'cd '
        .. get_path_to_d_parser(parser_info.name)
        .. ' && mv tree-sitter-markdown-inline/queries ./queries'
    )
  end

  if parser_info.name == 'typescript' then
    local queries_f = string.format('%s/%s', queries_path, 'tsx')
    os.execute(
      'cd '
        .. get_path_to_d_parser(parser_info.name)
        .. ' && mv queries '
        .. queries_f
    )
  end

  local queries_f = string.format('%s/%s', queries_path, parser_info.name)
  local success, _, _ = os.execute(
    'cd '
      .. get_path_to_d_parser(parser_info.name)
      .. ' && mv queries '
      .. queries_f
  )
  return success
end

M.clean_up = function(parser_info)
  local success, _, _ =
    os.execute('rm -rf ' .. get_path_to_d_parser(parser_info.name))
  return success
end

---@return boolean
M.install_tree_sitters_parsers = function()
  for i = 1, #M.parsers, 1 do
    local parser_info = M.parsers[i]

    if not M.download_parsers(parser_info) then
      return false
    end

    if not M.build_parsers(parser_info) then
      return false
    end

    if not M.move_parsers(parser_info) then
      return false
    end

    if not M.move_queries(parser_info) then
      return false
    end

    if not M.clean_up(parser_info) then
      return false
    end
  end

  return true
end

M.setup = function()
  vim.api.nvim_create_user_command('InstallGrammars', function()
    M.install_tree_sitters_parsers()
  end, { desc = 'Install Treesitter Grammars and Queries' })

  vim.treesitter.language.add 'bash'
  vim.treesitter.language.add 'cmake'
  vim.treesitter.language.add 'cpp'
  vim.treesitter.language.add 'css'
  vim.treesitter.language.add 'diff'
  vim.treesitter.language.add 'gleam'
  vim.treesitter.language.add 'go'
  vim.treesitter.language.add 'html'
  vim.treesitter.language.add 'javascript'
  vim.treesitter.language.add 'json'
  vim.treesitter.language.add 'markdown_inline'
  vim.treesitter.language.add 'odin'
  vim.treesitter.language.add 'python'
  vim.treesitter.language.add 'query'
  vim.treesitter.language.add 'regex'
  vim.treesitter.language.add 'rust'
  vim.treesitter.language.add 'sql'
  vim.treesitter.language.add 'tsx'
  vim.treesitter.language.add 'toml'
  vim.treesitter.language.add 'typescript'
  vim.treesitter.language.add 'zig'

  for i = 1, #M.parsers, 1 do
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { M.parsers[i].filetype },
      callback = function(args)
        vim.treesitter.start(args.buf, M.parsers[i].name)
      end,
    })
  end
end

return M
