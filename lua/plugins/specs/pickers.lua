return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
	   event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"natecraddock/telescope-zf-native.nvim",
				config = function()
					require("telescope").load_extension("zf-native")
				end,
			},
		},
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live Grep",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help Tags",
			},
		},
	},
}
