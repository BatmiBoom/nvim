local u = require 'utils.init'

local PARSER_DIR = vim.fn.expand '~/.config/nvim/parser/'
local QUERIES_DIR = vim.fn.expand '~/.config/nvim/queries/'
local PARSER_LIB_EXTENSION = vim.fn.has 'linux' == 1 and '.so' or '.dylib'

--- @class Parser
--- @field name string
--- @field url string
--- @field filetype string
--- @field parser_location string?
--- @field parser_name string?
--- @field queries_location string?
--- @field injected boolean?
--- @field need_download boolean?

---@param path string
---@param parser_info Parser
---@param need_location boolean?
---@return string
local construct_path_to_parser = function(path, parser_info, need_location)
  if need_location == nil then
    need_location = true
  end

  local repo_name = u.extract_repo_name(parser_info.url)

  local location = ''
  if need_location and parser_info.parser_location ~= nil then
    location = parser_info.parser_location
  end

  return path .. repo_name .. location
end

---@param path string
---@param parser_info Parser
---@return string
local construct_path_to_queries = function(path, parser_info)
  local repo_name = u.extract_repo_name(parser_info.url)

  local location = ''
  if parser_info.queries_location ~= nil then
    location = parser_info.queries_location
  end

  return path .. repo_name .. location
end

local notify = function(msg, level)
  if level == nil then
    level = vim.log.levels.INFO
  end

  vim.schedule(function()
    vim.notify(msg, level)
  end)
end

---@param cmd string
---@return vim.SystemCompleted
local function run_command(cmd)
  return vim.system({ 'sh', '-c', cmd }, { text = true }):wait()
end

local M = {}

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
    name = 'markdown',
    url = 'https://github.com/MDeiml/tree-sitter-markdown',
    filetype = 'markdown',
    need_download = false,
  },
  {
    name = 'markdown_inline',
    url = 'https://github.com/MDeiml/tree-sitter-markdown',
    filetype = 'markdown',
    parser_location = '/tree-sitter-markdown-inline',
    parser_name = 'markdown-inline',
    queries_location = '/tree-sitter-markdown-inline',
    injected = true,
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
    url = 'https://github.com/nvim-treesitter/tree-sitter-query',
    filetype = 'query',
    injected = true,
  },
  {
    name = 'regex',
    url = 'https://github.com/tree-sitter/tree-sitter-regex',
    filetype = 'regex',
    injected = true,
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
    parser_location = '/typescript',
    parser_name = 'parser',
    queries_location = ' ',
  },
  {
    name = 'tsx',
    url = 'https://github.com/tree-sitter/tree-sitter-typescript',
    filetype = 'typescriptreact',
    parser_location = '/tsx',
    parser_name = 'parser',
    queries_location = ' ',
  },
  {
    name = 'zig',
    url = 'https://github.com/tree-sitter-grammars/tree-sitter-zig',
    filetype = 'zig',
  },
}

-- Install Parsers in folder ~/.config/nvim/parser
---@param parser_info Parser
---@param fn function
M.install_parsers = function(parser_info, fn)
  notify('Installing parser for ' .. parser_info.name)

  return fn()
end

-- Download Parsers in folder ~/.config/nvim/parser
---@param parser_info Parser
---@return integer
M.download_parsers = function(parser_info)
  notify('Succesfully Downloaded Parser ' .. parser_info.name)
  local parsed_url = u.split(parser_info.url, '/')
  local repo_name = parsed_url[#parsed_url]
  if vim.fn.isabsolutepath(PARSER_DIR .. repo_name) == false then
    return 0
  end

  local cmd =
    run_command('cd ' .. PARSER_DIR .. ' && git clone ' .. parser_info.url)
  if cmd.stderr then
    vim.notify_once(cmd.stderr)
  end

  return cmd.code
end

-- Build the parsers
---@param parser_info Parser
---@return integer
M.build_parsers = function(parser_info)
  notify('Building Parser For ' .. parser_info.name)
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
      .. construct_path_to_parser(PARSER_DIR, parser_info, false)
      .. '&&  npm install'
  )

  return cmd.code
end

-- Generate .so o .dylib
---@param parser_info Parser
---@return integer
M.treesitter_build = function(parser_info)
  local cmd = run_command(
    'cd '
      .. construct_path_to_parser(PARSER_DIR, parser_info)
      .. ' && tree-sitter generate && tree-sitter build'
  )

  return cmd.code
end

-- Move Builded Parser
---@param parser_info Parser
M.move_parsers = function(parser_info)
  notify('Moving Parser For ' .. parser_info.name)
  local path_to_parser = construct_path_to_parser(PARSER_DIR, parser_info, true)
  local parser_name = parser_info.parser_name and parser_info.parser_name
    or parser_info.name

  local cmd = run_command(
    'cd '
      .. path_to_parser
      .. ' && mv '
      .. parser_name
      .. PARSER_LIB_EXTENSION
      .. ' '
      .. PARSER_DIR
      .. parser_info.name
      .. PARSER_LIB_EXTENSION
  )

  return cmd.code
end

-- Move Builded Parser
---@param parser_info Parser
M.move_queries = function(parser_info)
  notify('Moving Queries for ' .. parser_info.name, vim.log.levels.INFO)
  local path_to_queries = construct_path_to_queries(PARSER_DIR, parser_info)

  local cmd = run_command(
    'cd '
      .. path_to_queries
      .. ' && cp -r queries '
      .. QUERIES_DIR
      .. parser_info.name
  )

  return cmd.code
end

-- Remove github folder
---@param parser_info Parser
M.clean_up = function(parser_info)
  run_command(
    'rm -rf ' .. construct_path_to_parser(PARSER_DIR, parser_info, false)
  )
end

---@return boolean
M.install_tree_sitters_parsers = function()
  for _, parser_info in ipairs(M.parsers) do
    if parser_info.need_download == nil then
      M.install_parsers(parser_info, function()
        M.download_parsers(parser_info)
        M.build_parsers(parser_info)
        M.move_parsers(parser_info)
        M.move_queries(parser_info)
      end)
    end
  end

  for _, parser_info in ipairs(M.parsers) do
    if parser_info.need_download == nil then
      M.clean_up(parser_info)
    end
  end

  return true
end

M.setup = function()
  if vim.fn.isdirectory(vim.fn.expand '~/.config/nvim/parser') == false then
    vim.fn.mkdir(vim.fn.expand '~/.config/nvim/parser')
  end

  if vim.fn.isdirectory(vim.fn.expand '~/.config/nvim/queries') == false then
    vim.fn.mkdir(vim.fn.expand '~/.config/nvim/queries')
  end

  vim.api.nvim_create_user_command('InstallGrammars', function()
    M.install_tree_sitters_parsers()
  end, { desc = 'Install Treesitter Grammars and Queries' })

  vim.treesitter.language.register('javascript', 'javascriptreact')

  for _, p in ipairs(M.parsers) do
    vim.treesitter.language.add(p.name)

    if p.injected ~= false then
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { p.filetype },
        callback = function(args)
          vim.treesitter.start(args.buf, p.name)
        end,
      })
    end
  end
end

return M
