return {
	{
		"NTBBloodbath/galaxyline.nvim",
		opts = {},
		lazy = false,
		config = function()
			require("galaxyline.themes.eviline")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
