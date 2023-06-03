local fn, api = vim.fn, vim.api

return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			})
		end,
		keys = {
			{
				"<leader>e",
				"<cmd>NvimTreeToggle<CR>",
				desc = "Open file tree",
			},
		},
	},
}
