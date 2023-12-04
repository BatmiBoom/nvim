return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		config = true,
		keys = {
			{
				"<leader>q",
				function()
					require("neogit").open({ kind = "vsplit" })
				end,
				desc = "Open NeoGit",
			},
		},
	},
}
