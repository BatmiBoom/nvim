vim.pack.add({ "https://github.com/nvim-mini/mini.pick" })
require("mini.pick").setup()

vim.api.nvim_set_keymap("n", "<leader>f", ":Pick files<CR>", { desc = "Opens File Picker" })
vim.api.nvim_set_keymap("n", "<leader>b", ":Pick buffers<CR>", { desc = "Opens Buffer Picker" })
vim.api.nvim_set_keymap("n", "<leader>/", ":Pick grep_live<CR>", { desc = "Opens File Picker" })
vim.api.nvim_set_keymap("n", "<leader>h", ":Pick help<CR>", { desc = "Opens File Picker" })
