-- keymap
---------------------------------------------------------------------------

-- Exit insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- Find
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Remove highlight
vim.keymap.set("n", "<Esc>", ":noh<CR>")

-- Navigate visual lines
vim.keymap.set({ "n", "x" }, "j", "gj", { desc = "Navigate down (visual line)" })
vim.keymap.set({ "n", "x" }, "k", "gk", { desc = "Navigate up (visual line)" })
vim.keymap.set({ "n", "x" }, "<Down>", "gj", { desc = "Navigate down (visual line)" })
vim.keymap.set({ "n", "x" }, "<Up>", "gk", { desc = "Navigate up (visual line)" })
vim.keymap.set("i", "<Down>", "<C-\\><C-o>gj", { desc = "Navigate down (visual line)" })
vim.keymap.set("i", "<Up>", "<C-\\><C-o>gk", { desc = "Navigate up (visual line)" })

-- Move Lines
vim.keymap.set({ "n", "x" }, "<M-S-Up>", ":move -2<cr>", { desc = "Move Line Up" })
vim.keymap.set({ "n", "x" }, "<M-S-Down>", ":move +1<cr>", { desc = "Move Line Down" })
vim.keymap.set("i", "<M-S-Up>", "<C-o>:move -2<cr>", { desc = "Move Line Up" })
vim.keymap.set("i", "<M-S-Down>", "<C-o>:move +1<cr>", { desc = "Move Line Down" })

-- Easier interaction with the system clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
