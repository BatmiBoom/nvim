local custom_functions = require 'batmi.core.functions'

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- PERSONAL
map('n', '<leader>op', custom_functions.open_floating_window)
-----------------

-- BETTER ESCAPE
map('i', 'jk', '<Esc>', {})

-- MAKE FILE EXECUTABLE
map('n', '<leader>0', ':!chmod +x % <CR>', {})

-- BETTER UP/DOWN
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- EXECUTE TMUX-SESSIONIZER
map('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>', {})

-- MOVING THROUGH WRAPPED LINES
map('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- UP A LINE
map('n', 'J', 'mzJ`z', {})

-- BETTER SCROLLING
map('n', '<C-d>', '<C-d>zz', {})
map('n', '<C-u>', '<C-u>zz', {})

-- BETTER SEARCH
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next search result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev search result' })
map('x', 'N', "'nN'[v:searchorward]", { expr = true, desc = 'Prev search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- RESIZE VERTICAL SPLIT
map('n', '<C-left>', ':vertical resize +3<CR>', {})
map('n', '<C-right>', ':vertical resize -3<CR>', {})

-- RESIZE HORIZONTAL SPLIT
map('n', '<C-up>', ':horizontal resize +3<CR>', {})
map('n', '<C-down>', ':horizontal resize -3<CR>', {})

-- Copy to system clipboard
map({ 'n', 'v' }, '<leader>y', [["+y]], {})
map({ 'n', 'v' }, '<leader>d', [["_d]], { remap = false })

-- keep pasting over the same thing, ie. delete content and paste something in it place
map('n', '<leader>p', [[m`0"_DP``]], {})
map('v', '<leader>p', [[m`"_dP``]], {})

-- Paste from sytem clipboard
map('n', '<leader>P', [[+p]], {})

-- Yank to sytem clipboard
map('n', '<leader>Y', [[+y]], {})

-- Clear search
map('n', '<Esc>', '<cmd>nohlsearch<CR>', {})

-- New tab
map('n', 'te', ':tabedit<CR>', {})
map('n', 'tx', ':tabclose<CR>', {})
map('n', '<TAB>', ':tabnext<CR>', {})
map('n', '<S-TAB>', ':tabprev<CR>', {})

-- Split window
map('n', 'zh', ':split<CR>', {})
map('n', 'zv', ':vsplit<CR>', {})
map('n', 'zx', ':close<CR>', {})

-- MOVE LINES
map('v', 'J', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
map('v', 'K', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- Better Scrolling
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')

-- BETTER INDENTING
map('v', '<', '<gv')
map('v', '>', '>gv')
