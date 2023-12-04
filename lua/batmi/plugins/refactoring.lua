return {
	{
		"ThePrimeagen/refactoring.nvim",
		event = { "BufEnter" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
}
