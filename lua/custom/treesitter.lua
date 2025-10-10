local u = require 'utils.init'

local M = {}

local absolute_parser_path = '~/.config/nvim/parser/'
local absolute_queries_path = '~/.config/nvim/queries/'
local parser_extension = vim.fn.has 'mac' and '.so' or '.dyalib'

--- @class Parser
--- @field name string
--- @field url string
--- @field filetype string
--- @field location string

---@param path string
---@param parser_info Parser
---@return string
local get_path_to_d_parser = function(path, parser_info)
  local folder_name = u.split(parser_info.url, '/')
  return path .. folder_name[4] .. parser_info.location
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
    location = '',
  },
  {
    name = 'cmake',
    url = 'https://github.com/uyha/tree-sitter-cmake',
    filetype = 'cmake',
    location = '',
  },
  {
    name = 'cpp',
    url = 'https://github.com/tree-sitter/tree-sitter-cpp',
    filetype = 'cpp',
    location = '',
  },
  {
    name = 'gitignore',
    url = 'https://github.com/shunsambongi/tree-sitter-gitignore',
    filetype = 'gitignore',
    location = '',
  },
  {
    name = 'css',
    url = 'https://github.com/tree-sitter/tree-sitter-css',
    filetype = 'css',
    location = '',
  },
  {
    name = 'diff',
    url = 'https://github.com/the-mikedavis/tree-sitter-diff',
    filetype = 'diff',
    location = '',
  },
  {
    name = 'gleam',
    url = 'https://github.com/gleam-lang/tree-sitter-gleam',
    filetype = 'gleam',
    location = '',
  },
  {
    name = 'go',
    url = 'https://github.com/tree-sitter/tree-sitter-go',
    filetype = 'go',
    location = '',
  },
  {
    name = 'html',
    url = 'https://github.com/tree-sitter/tree-sitter-html',
    filetype = 'html',
    location = '',
  },
  {
    name = 'javascript',
    url = 'https://github.com/tree-sitter/tree-sitter-javascript',
    filetype = 'javascript',
    location = '',
  },
  {
    name = 'javascriptreact',
    url = 'https://github.com/tree-sitter/tree-sitter-javascript',
    filetype = 'javascriptreact',
    location = '',
  },
  {
    name = 'json',
    url = 'https://github.com/tree-sitter/tree-sitter-json',
    filetype = 'json',
    location = '',
  },
  {
    name = 'markdown_inline',
    url = 'https://github.com/MDeiml/tree-sitter-markdown',
    filetype = 'markdown',
    location = 'tree-sitter-markdown-inline',
  },
  {
    name = 'odin',
    url = 'https://github.com/amaanq/tree-sitter-odin',
    filetype = 'odin',
    location = '',
  },
  {
    name = 'python',
    url = 'https://github.com/tree-sitter/tree-sitter-python',
    filetype = 'python',
    location = '',
  },
  {
    name = 'regex',
    url = 'https://github.com/tree-sitter/tree-sitter-regex',
    filetype = 'regex',
    location = '',
  },
  {
    name = 'rust',
    url = 'https://github.com/tree-sitter/tree-sitter-rust',
    filetype = 'rust',
    location = '',
  },
  {
    name = 'sql',
    url = 'https://github.com/derekstride/tree-sitter-sql',
    filetype = 'sql',
    location = '',
  },
  {
    name = 'toml',
    url = 'https://github.com/tree-sitter-grammars/tree-sitter-toml',
    filetype = 'toml',
    location = '',
  },
  {
    name = 'typescript',
    url = 'https://github.com/tree-sitter/tree-sitter-typescript',
    filetype = 'typescript',
    location = '/typescript',
  },
  {
    name = 'tsx',
    url = 'https://github.com/tree-sitter/tree-sitter-typescript',
    filetype = 'typescriptreact',
    location = '/tsx',
  },
  {
    name = 'zig',
    url = 'https://github.com/tree-sitter-grammars/tree-sitter-zig',
    filetype = 'zig',
    location = '',
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
  local treesitter_result = M.treesitter_generate(parser_info)

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
      .. get_path_to_d_parser(absolute_parser_path, parser_info)
      .. '&&  npm install'
  )

  return cmd.code
end

-- Generate .so o .dyalib
---@param parser_info Parser
---@return integer
M.treesitter_generate = function(parser_info)
  local cmd = run_command(
    'cd '
      .. get_path_to_d_parser(absolute_parser_path, parser_info)
      .. parser_info.location
      .. ' && tree-sitter generate && tree-sitter build'
  )

  return cmd.code
end

-- Move Builded Parser
---@param parser_info Parser
M.move_parsers = function(parser_info)
  local path_to_parser = get_path_to_d_parser(absolute_parser_path, parser_info)
  local parser_name = u.split(parser_info.url, '/')[4] == parser_info.name
      and parser_info.name
    or u.split(parser_info.url, '/')[4]

  local cmd = run_command(
    'cd '
      .. path_to_parser
      .. ' && mv '
      .. parser_name
      .. parser_extension
      .. ' ../'
      .. parser_info.name
      .. parser_extension
  )

  return cmd.code
end

-- Move Builded Parser
---@param parser_info Parser
M.move_queries = function(parser_info)
  local path_to_parser = get_path_to_d_parser(absolute_parser_path, parser_info)

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

    vim.notify_once('Downloading Parser for ' .. parser_info.name)
    if M.download_parsers(parser_info) == 0 then
      vim.notify_once('Succesfully Downloaded Parser ' .. parser_info.name)
    end

    vim.notify_once('Building Parser For ' .. parser_info.name)
    if M.build_parsers(parser_info) == 0 then
      vim.notify_once('Succesfully Build Parser ' .. parser_info.name)
    end

    vim.notify_once('Moving Parser For ' .. parser_info.name)
    if M.move_parsers(parser_info) == 0 then
      vim.notify_once('Succesfully Moved Parser ' .. parser_info.name)
    end

    vim.notify_once('Moving Queries for ' .. parser_info.name)
    if M.move_queries(parser_info) == 0 then
      vim.notify_once('Succesfully Moved Queries ' .. parser_info.name)
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
