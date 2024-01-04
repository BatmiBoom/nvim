return {
	{
		"echasnovski/mini.files",
		version = false,
		opts = {
			content = {
				filter = nil,
				prefix = nil,
				sort = nil,
			},
			mappings = {
				close = "q",
				go_in = "l",
				go_in_plus = "L",
				go_out = "h",
				go_out_plus = "H",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},
			options = {
				permanent_delete = true,
				use_as_default_explorer = true,
			},
			windows = {
				max_number = 2,
				preview = true,
				width_focus = 50,
				width_nofocus = 15,
				width_preview = 100,
			},
		},
		keys = {
			{
				"-",
				function()
					require("mini.files").open()
				end,
				desc = "Open tree",
			},
		},
	},
}
