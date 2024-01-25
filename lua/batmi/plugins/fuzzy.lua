return {
	{
		"ibhagwan/fzf-lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("fzf-lua").setup({
				"fzf-native",
				winopts = { preview = { default = "bat" } },
			})
		end,
		keys = {
			{
				";;",
				"<CMD>FzfLua files<cr>",
				{ silent = true, noremap = true, desc = "Find File" },
			},
			{
				";s",
				"<CMD>FzfLua resume<CR>",
				{ silent = true, noremap = true, desc = "Resume wor" },
			},
			{
				";f",
				"<CMD>FzfLua git_files<cr>",
				{ silent = true, noremap = true, desc = "Find Git Files" },
			},
			{
				";r",
				"<CMD>FzfLua live_grep_native<cr>",
				{ silent = true, noremap = true, desc = "Live Grep" },
			},
			{
				";rg",
				"<CMD>FzfLua live_grep_resume<cr>",
				{ silent = true, noremap = true, desc = "Live Grep Resume" },
			},
			{
				"\\\\",
				"<CMD>FzfLua buffers<cr>",
				{ silent = true, noremap = true, desc = "Search Open Buffers" },
			},
			{
				";d",
				"<CMD>FzfLua diagnostics_documents<cr>",
				{ silent = true, noremap = true, desc = "Diagnostics" },
			},
		},
	},
}
