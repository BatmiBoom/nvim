return {
	{
		"linrongbin16/fzfx.nvim",
		dependencies = {
			{
				"junegunn/fzf",
				build = function()
					vim.fn["fzf#install"]()
				end,
			},
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			fzf_color_opts = {
				fg = { "fg", "Normal" },
				bg = { "bg", "Normal" },
				hl = { "fg", "Comment" },
				["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
				["bg+"] = { "bg", "CursorLine", "CursorColumn" },
				["hl+"] = { "fg", "Statement" },
				info = { "fg", "PreProc" },
				border = { "fg", "Ignore" },
				prompt = { "fg", "Conditional" },
				pointer = { "fg", "Exception" },
				marker = { "fg", "Keyword" },
				spinner = { "fg", "Label" },
				header = { "fg", "Comment" },
				preview_label = { "fg", "Label" },
			},
		},
		keys = {
			{
				";;",
				"<cmd>FzfxFiles<cr>",
				{ silent = true, noremap = true, desc = "File explorer" },
			},
			{
				";f",
				"<cmd>FzfxGFiles<cr>",
				{ silent = true, noremap = true, desc = "File explorer" },
			},
			{
				";r",
				"<cmd>FzfxLiveGrep<cr>",
				{ silent = true, noremap = true, desc = "File explorer" },
			},
			{
				"\\\\",
				"<cmd>FzfxBuffers<cr>",
				{ silent = true, noremap = true, desc = "File explorer" },
			},
			{
				"-",
				"<cmd>FzfxFileExplorer<cr>",
				{ silent = true, noremap = true, desc = "File explorer" },
			},
			{
				";d",
				"<cmd>FzfxLspDiagnostics<cr>",
				{ silent = true, noremap = true, desc = "File explorer" },
			},
		},
	},
}
