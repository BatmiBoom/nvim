return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			ui = {
				border = "rounded",
				devicon = true,
				title = true,
				code_action = "CA",
			},
			finder = {
				max_height = 0.6,
				keys = {
					shuttle = "[w",
					toggle_or_open = "<C-c>o",
					vsplit = "<C-c>v",
					split = "<C-c>i",
					tabe = "<C-c>t",
					tabnew = "<C-c>te",
					quit = "q",
					close = "<C-c>k",
				},
			},
			symbol_in_winbar = {
				enable = false,
				separtor = " | ",
				show_file = true,
			},
			code_action = {
				num_shortcut = true,
				show_server_name = true,
				extend_gitsigns = false,
				keys = {
					quit = "q",
					exec = "<CR>",
				},
			},
			definition = {
				width = 0.6,
				height = 0.5,
				keys = {
					edit = "<C-c>o",
					vsplit = "<C-c>v",
					split = "<C-c>i",
					tabe = "<C-c>t",
					quit = "q",
					close = "<C-c>k",
				},
			},
			hover = {
				max_width = 0.9,
				max_height = 0.8,
				open_link = "gx",
				open_cmd = "!chrome",
			},
			lightbulb = {
				enable = true,
				sign = true,
				virtual_text = false,
				priority = 100,
			},
			rename = {
				in_select = true,
				auto_save = false,
				project_max_width = 0.5,
				project_max_height = 0.5,
				keys = {
					quit = "q",
					exec = "<CR>",
					select = "x",
				},
			},
		})

		vim.keymap.set("n", "mfr", "<CMD>Lspsaga finder ref<CR>")
		vim.keymap.set("n", "mfd", "<CMD>Lspsaga finder def<CR>")
		vim.keymap.set("n", "gi", "<CMD>Lspsaga finder imp<CR>")
		vim.keymap.set("n", "mca", "<CMD>Lspsaga code_action<CR>")
		vim.keymap.set("n", "gd", "<CMD>Lspsaga peek_definition<CR>")
		vim.keymap.set("n", "gtd", "<CMD>Lspsaga peek_type_definition<CR>")
		vim.keymap.set("n", "gD", "<CMD>Lspsaga goto_definition<CR>")
		vim.keymap.set("n", "gtD", "<CMD>Lspsaga goto_type_definition<CR>")
		vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc ++keep<CR>")
		vim.keymap.set("n", "mrn", "<CMD>Lspsaga rename ++project<CR>")
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
