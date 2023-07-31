return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {},
		keys = {
			{
				"<S-l>", "<cmd>BufferNext<CR>",desc = "Next Tab",
			},
			{
				"<S-h>", "<cmd>BufferPrevious<CR>",desc = "Next Tab",
			},
			{
				"<leader>bc", "<cmd>BufferClose<CR>",desc = "Next Tab",
			},
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
}
