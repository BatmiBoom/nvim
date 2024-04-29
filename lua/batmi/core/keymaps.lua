local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- INSERT

-- BETTER ESCAPE
map('i', 'jk', '<Esc>', {})
map('i', 'kj', '<Esc>', {})

-- NORMAL
map('t', '<C-x><C-c>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- OPEN MINIFILES
map('n', '-', function()
  MiniFiles.open()
end, {})

-- DISABLED ARROWS
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>', {})
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>', {})
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>', {})
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>', {})

-- BETTER UP/DOWN
map('n', 'j', 'jzz', {})
map('n', 'k', 'kzz', {})

-- MAKE FILE EXECUTABLE
map('n', '<leader>0', ':!chmod +x % <CR>', {})

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

-- BETTER UP/DOWN
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

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

-- Copy to system clipboard
map({ 'n', 'v' }, '<leader>y', [["+y]], {})
map({ 'n', 'v' }, '<leader>d', [["_d]], {})

map('n', '<Esc>', '<cmd>nohlsearch<CR>', {})

-- New tab
map('n', 'te', ':tabedit<CR>', {})
map('n', 'tc', ':tabclose<CR>', {})
map('n', 'tn', ':tabnext<Return>', {})
map('n', 'tp', ':tabprev<Return>', {})

-- Split window
map('n', 'zh', ':split<Return>', {})
map('n', 'zv', ':vsplit<Return>', {})
map('n', 'zx', ':close<Return>', {})

-- Diagnostics
map('n', '<space>xx', vim.diagnostic.open_float, {})
map('n', '<leader>xn', vim.diagnostic.setloclist, {})
map('n', '<C-j>', function()
  vim.diagnostic.goto_next()
end)

-- VISUAL

-- MOVE LINES
map('v', 'J', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
map('v', 'K', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- Better Scrolling
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')

-- BETTER INDENTING
map('v', '<', '<gv')
map('v', '>', '>gv')
