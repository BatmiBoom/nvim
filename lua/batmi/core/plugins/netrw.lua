vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_sizestyle = 'H'
vim.g.netrw_liststyle = 3
vim.g.netrw_list_hide = vim.fn['netrw_gitignore#Hide']()
vim.g.netrw_hide = 0
vim.g.netrw_browse_split = 4

-- Highlight marked files
vim.cmd 'hi! link netrwMarkFile Search'

-- local function netrw_maps()
--   if vim.bo.filetype ~= 'netrw' then
--     return
--   end
--
--   local opts = { silent = true }
--
--   -- Toggle dotfiles
--   vim.api.nvim_buf_set_keymap(0, 'n', '.', 'gh', opts)
--
--   -- Open file and close netrw
--   vim.api.nvim_buf_set_keymap(0, 'n', 'l', '<CR>:Lexplore<CR>', opts)
--
--   -- Open file or directory
--   vim.api.nvim_buf_set_keymap(0, 'n', 'o', '<CR>', opts)
--
--   -- Close netrw
--   vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':Lexplore<CR>', opts)
--
--   -- Create a new file and save it
--   vim.api.nvim_buf_set_keymap(0, 'n', 'ff', '%:w<CR>:buffer #<CR>', opts)
--
--   -- Create a new directory
--   vim.api.nvim_buf_set_keymap(0, 'n', 'fa', 'd', opts)
--
--   -- Rename file
--   vim.api.nvim_buf_set_keymap(0, 'n', 'fr', 'R', opts)
--
--   -- Remove file or directory
--   vim.api.nvim_buf_set_keymap(0, 'n', 'fd', 'D', opts)
--
--   -- Copy marked file
--   vim.api.nvim_buf_set_keymap(0, 'n', 'fc', 'mc', opts)
--
--   -- Copy marked file in one step, with this we can put the cursor in a directory
--   -- after marking the file to assign target directory and copy file
--   vim.api.nvim_buf_set_keymap(0, 'n', 'fC', 'mtmc', opts)
--
--   -- Move marked file
--   vim.api.nvim_buf_set_keymap(0, 'n', 'fx', 'mm', opts)
--
--   -- Move marked file in one step, same as fC but for moving files
--   vim.api.nvim_buf_set_keymap(0, 'n', 'fX', 'mtmm', opts)
--
--   -- Execute commands in marked file or directory
--   vim.api.nvim_buf_set_keymap(0, 'n', 'fe', 'mx', opts)
--
--   -- Show a list of marked files and directories
--   vim.api.nvim_buf_set_keymap(0, 'n', 'fm', ':echo "Marked files:\n" . join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>', opts)
--
--   -- Show target directory
--   vim.api.nvim_buf_set_keymap(0, 'n', 'ft', ':echo "Target: " . netrw#Expose("netrwmftgt")<CR>', opts)
--
--   -- Toggle the mark on a file or directory
--   vim.api.nvim_buf_set_keymap(0, 'n', '<TAB>', 'mf', opts)
--
--   -- Unmark all the files in the current buffer
--   vim.api.nvim_buf_set_keymap(0, 'n', '<S-TAB>', 'mF', opts)
--
--   -- Remove all the marks on all files
--   vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><TAB>', 'mu', opts)
--
--   -- Create a bookmark
--   vim.api.nvim_buf_set_keymap(0, 'n', 'bc', 'mb', opts)
--
--   -- Remove the most recent bookmark
--   vim.api.nvim_buf_set_keymap(0, 'n', 'bd', 'mB', opts)
--
--   -- Jumo to the most recent bookmark
--   vim.api.nvim_buf_set_keymap(0, 'n', 'bj', 'gb', opts)
-- end
