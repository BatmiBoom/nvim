return {
	{
		"echasnovski/mini.surround",
		version = false,
		event = { "BufReadPost" },
		opts = {
			custom_surroundings = nil,
			highlight_duration = 500,
			mappings = {
				add = "qa",
				delete = "qd",
				find = "qf",
				find_left = "qF",
				highlight = "qh",
				replace = "qr",
				update_n_lines = "qn",

				suffix_last = "l",
				suffix_next = "n",
			},
			n_lines = 20,
			respect_selection_type = false,
			search_method = "cover",
			silent = false,
		},
	},
}
