local M = {}

local parsers = {
  'bash',
  'cmake',
  'cpp',
  'css',
  'diff',
  'gitignore',
  'gleam',
  'go',
  'html',
  'javascript',
  'json',
  'jsonc',
  'markdown_inline',
  'odin',
  'python',
  'query',
  'regex',
  'rust',
  'sql',
  'tsx',
  'toml',
  'typescript',
  'vim',
  'zig',
}

-- Download Parsers in folder ~/.config/nvim/parser
M.download_parsers = function(language)
  local cmd = string.format(
    'git clone https://github.com/tree-sitter/tree-sitter-%s ~/.config/nvim/parser/%s-parser',
    language
  )
  return os.execute(cmd)
end

-- Build the parsers
M.build_parsers = function(language)
  local path = string.format('~/.config/nvim/parsers/%s-parser', language)
  local cmd = string.format('cd %s && make', path)
  return os.execute(cmd)
end

M.clean_up = function() end

M.install_tree_sitters_parsers = function()
  for i = 1, #parsers, 1 do
    if M.download_parsers(parsers[i]) then
      print('Success downloading parser for ' .. parsers[i])
      if M.build_parsers(parsers[i]) then
        print('Success intalling parser for ' .. parsers[i])
      else
        print('Failed intalling parser for ' .. parsers[i])
      end
    else
      print('Failed downloading parser for ' .. parsers[i])
    end
  end
end

return M
