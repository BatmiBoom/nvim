local u = require 'utils.init'

local M = {}

local absolute_parser_path = '~/.config/nvim/parser/'
local absolute_queries_path = '~/.config/nvim/queries/'
local parser_extension = vim.fn.has 'mac' and '.dylib' or '.so'

--- @class Parser
--- @field name string
--- @field url string
--- @field filetype string
--- @field location string?
--- @field parser_name string?
--- @field queries_location string?

---@param path string
---@param parser_info Parser
---@param location string?
---@param need_location boolean?
---@return string
local get_path_to_d_parser = function(
  path,
  parser_info,
  location,
  need_location
)
  if need_location == nil then
    need_location = true
  end

  if location == nil then
    location = need_location and parser_info.location or ''
  end

  local folder_name = u.split(parser_info.url, '/')[4]

  return path .. folder_name .. location
end

---@param cmd string
---@return vim.SystemCompleted
local function run_command(cmd)
  return vim.system({ 'fish', '-c', cmd }, { text = true }):wait()
end

---@type Parser[]
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
    name = 'gitignore',
    url = 'https://github.com/shunsambongi/tree-sitter-gitignore',
    filetype = 'gitignore',
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
    name = 'javascriptreact',
    url = 'https://github.com/tree-sitter/tree-sitter-javascript',
    filetype = 'javascriptreact',
    parser_name = 'javascript',
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
    location = '/tree-sitter-markdown-inline',
    parser_name = 'markdown-inline',
    queries_location = '/tree-sitter-markdown',
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
    location = '/typescript',
    parser_name = 'parser',
    queries_location = ' ',
  },
  {
    name = 'tsx',
    url = 'https://github.com/tree-sitter/tree-sitter-typescript',
    filetype = 'typescriptreact',
    location = '/tsx',
    parser_name = 'parser',
    queries_location = ' ',
  },
  {
    name = 'zig',
    url = 'https://github.com/tree-sitter-grammars/tree-sitter-zig',
    filetype = 'zig',
  },
}

-- Download Parsers in folder ~/.config/nvim/parser
---@param parser_info Parser
---@return integer
M.download_parsers = function(parser_info)
  local cmd = run_command(
    'cd ' .. absolute_parser_path .. ' && git clone ' .. parser_info.url
  )
  if cmd.stderr then
    vim.notify_once(cmd.stderr)
  end

  return cmd.code
end

-- Build the parsers
---@param parser_info Parser
---@return integer
M.build_parsers = function(parser_info)
  local npm_result = M.npm_install(parser_info)
  local treesitter_result = M.treesitter_build(parser_info)

  if npm_result ~= 0 or treesitter_result ~= 0 then
    return 1
  else
    return 0
  end
end

-- Install npm packages
---@param parser_info Parser
M.npm_install = function(parser_info)
  local cmd = run_command(
    'cd '
      .. get_path_to_d_parser(absolute_parser_path, parser_info, nil, false)
      .. '&&  npm install'
  )

  return cmd.code
end

-- Generate .so o .dyalib
---@param parser_info Parser
---@return integer
M.treesitter_build = function(parser_info)
  local cmd = run_command(
    'cd '
      .. get_path_to_d_parser(absolute_parser_path, parser_info)
      .. ' && tree-sitter generate && tree-sitter build'
  )

  return cmd.code
end

-- Move Builded Parser
---@param parser_info Parser
M.move_parsers = function(parser_info)
  local path_to_parser = get_path_to_d_parser(absolute_parser_path, parser_info)
  local parser_name = parser_info.parser_name and parser_info.parser_name
    or parser_info.name

  local cmd = run_command(
    'cd '
      .. path_to_parser
      .. ' && mv '
      .. parser_name
      .. parser_extension
      .. ' '
      .. absolute_parser_path
      .. parser_info.name
      .. parser_extension
  )

  return cmd.code
end

-- Move Builded Parser
---@param parser_info Parser
M.move_queries = function(parser_info)
  local location = nil
  local need_location = false
  if parser_info.queries_location ~= nil then
    location = parser_info.queries_location
    need_location = true
  end

  local path_to_parser = get_path_to_d_parser(
    absolute_parser_path,
    parser_info,
    location,
    need_location
  )

  local cmd = run_command(
    'cd '
      .. path_to_parser
      .. ' && mv queries '
      .. absolute_queries_path
      .. parser_info.name
  )

  return cmd.code
end

-- Remove github folder
---@param parser_info Parser
M.clean_up = function(parser_info)
  run_command(
    'rm -rf ' .. get_path_to_d_parser(absolute_parser_path, parser_info)
  )
end

---@return boolean
M.install_tree_sitters_parsers = function()
  for i = 1, #M.parsers, 1 do
    local parser_info = M.parsers[i]

    vim.schedule(function()
      vim.notify(
        'Downloading Parser for ' .. parser_info.name,
        vim.log.levels.INFO
      )
    end)
    if M.download_parsers(parser_info) == 0 then
      vim.schedule(function()
        vim.notify(
          'Succesfully Downloaded Parser ' .. parser_info.name,
          vim.log.levels.INFO
        )
      end)
    end

    vim.schedule(function()
      vim.notify(
        'Building Parser For ' .. parser_info.name,
        vim.log.levels.INFO
      )
    end)
    if M.build_parsers(parser_info) == 0 then
      vim.schedule(function()
        vim.notify(
          'Succesfully Build Parser ' .. parser_info.name,
          vim.log.levels.INFO
        )
      end)
    end

    vim.schedule(function()
      vim.notify('Moving Parser For ' .. parser_info.name, vim.log.levels.INFO)
    end)
    if M.move_parsers(parser_info) == 0 then
      vim.schedule(function()
        vim.notify(
          'Succesfully Moved Parser ' .. parser_info.name,
          vim.log.levels.INFO
        )
      end)
    end

    vim.schedule(function()
      vim.notify('Moving Queries for ' .. parser_info.name, vim.log.levels.INFO)
    end)
    if M.move_queries(parser_info) == 0 then
      vim.schedule(function()
        vim.notify(
          'Succesfully Moved Queries ' .. parser_info.name,
          vim.log.levels.INFO
        )
      end)
    end
    --
    -- for i = 1, #M.parsers, 1 do
    --   M.clean_up(M.parsers[i])
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
