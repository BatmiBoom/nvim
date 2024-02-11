return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = { height = 0.95 },
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			require("telescope").load_extension("fzf")
		end,
		keys = {
			{
				";;",
				"<CMD>Telescope find_files<cr>",
				{ silent = true, noremap = true, desc = "Find File" },
			},
			{
				";f",
				"<CMD>Telescope git_files<cr>",
				{ silent = true, noremap = true, desc = "Find Git Files" },
			},
			{
				";r",
				"<CMD>Telescope live_grep<cr>",
				{ silent = true, noremap = true, desc = "Live Grep" },
			},
			{
				"\\\\",
				"<CMD>Telescope buffers<cr>",
				{ silent = true, noremap = true, desc = "Search Open Buffers" },
			},
			{
				";h",
				"<CMD>Telescope help_tags<cr>",
				{ silent = true, noremap = true, desc = "Help Tags" },
			},
		},
	},
}
