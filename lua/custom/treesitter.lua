local M = {}

local parsers = {
    'bash',
    'cmake',
    'c',
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
    'lua',
    'markdown',
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
    'vimdoc',
    'vim',
    'zig',
}

-- Download Parsers in folder ~/.config/nvim/parser
M.download_parsers = function()
end

-- Build the parsers
M.build_parsers = function()
end

M.clean_up = function()
end

M.install_tree_sitters_parsers = function()
    M.download_parsers()
    M.build_parsers()
    M.clean_up()
end

return M
