vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Quit Normal Mode' })
vim.keymap.set('n', '<ESC>', '<CMD>noh<CR>', { desc = 'Remove Highlighting' })

vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open TreeFile' })

-- Copy to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
