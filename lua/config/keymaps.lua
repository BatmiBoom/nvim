vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Quit Normal Mode' })
vim.keymap.set('n', '<ESC>', '<CMD>noh<CR>', { desc = 'Remove Highlighting' })

vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open TreeFile' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Copy to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
