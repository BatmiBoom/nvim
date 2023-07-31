return {
	{
		"ibhagwan/fzf-lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local actions = require("fzf-lua.actions")
			require("fzf-lua").setup({
				fzf_bin = "sk",
				winopts = {
					split = "belowright new", -- open in a split instead?
				},
				keymap = {
					builtin = {
						["<F1>"] = "toggle-help",
						["<F2>"] = "toggle-fullscreen",
						["<F3>"] = "toggle-preview-wrap",
						["<F4>"] = "toggle-preview",
						["<F5>"] = "toggle-preview-ccw",
						["<F6>"] = "toggle-preview-cw",
						["<S-down>"] = "preview-page-down",
						["<S-up>"] = "preview-page-up",
						["<S-left>"] = "preview-page-reset",
					},
					fzf = {
						["ctrl-z"] = "abort",
						["ctrl-u"] = "unix-line-discard",
						["ctrl-f"] = "half-page-down",
						["ctrl-b"] = "half-page-up",
						["ctrl-a"] = "beginning-of-line",
						["ctrl-e"] = "end-of-line",
						["alt-a"] = "toggle-all",
						["f3"] = "toggle-preview-wrap",
						["f4"] = "toggle-preview",
						["shift-down"] = "preview-page-down",
						["shift-up"] = "preview-page-up",
					},
				},
				actions = {
					files = {
						["default"] = actions.file_edit_or_qf,
						["ctrl-s"] = actions.file_split,
						["ctrl-v"] = actions.file_vsplit,
						["ctrl-t"] = actions.file_tabedit,
						["alt-q"] = actions.file_sel_to_qf,
						["alt-l"] = actions.file_sel_to_ll,
					},
					buffers = {
						["default"] = actions.buf_edit,
						["ctrl-s"] = actions.buf_split,
						["ctrl-v"] = actions.buf_vsplit,
						["ctrl-t"] = actions.buf_tabedit,
					},
				},
			})
		end,
		keys = {
			{
				"<leader>ff",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>gf",
				function()
					require("fzf-lua").git_files()
				end,
				desc = "Git Files",
			},
			{
				"<leader>sg",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Live Grep",
			},
			{
				"<leader>fb",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>sw",
				function()
					require("fzf-lua").grep()
				end,
				desc = "Grep String",
			},
			{
				"<leader>sd",
				function()
					require("fzf-lua").diagnostics_documents()
				end,
				desc = "Grep String",
			},
			{
				"<leader>gh",
				function()
					require("fzf-lua").lsp_finder()
				end,
				desc = "Lsp Finder",
			},
		},
	},
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	branch = "0.1.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		{
	-- 			"nvim-telescope/telescope-fzf-native.nvim",
	-- 			build = "make",
	-- 			cond = function()
	-- 				return vim.fn.executable("make") == 1
	-- 			end,
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		-- [[ Configure Telescope ]]
	-- 		-- See `:help telescope` and `:help telescope.setup()`
	-- 		require("telescope").setup({
	-- 			defaults = {
	-- 				mappings = {
	-- 					i = {
	-- 						["<C-u>"] = false,
	-- 						["<C-d>"] = false,
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		-- Enable telescope fzf native, if installed
	-- 		pcall(require("telescope").load_extension, "fzf")
	-- 	end,
	-- 	keys = {
	-- 		{
	-- 			"<leader>/",
	-- 			function()
	-- 				-- You can pass additional configuration to telescope to change theme, layout, etc.
	-- 				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
	-- 					winblend = 10,
	-- 					previewer = false,
	-- 				}))
	-- 			end,
	-- 			desc = "Fuzzily search in current buffer",
	-- 		},
	-- 		{
	-- 			"<leader>ff",
	-- 			function()
	-- 				require("telescope.builtin").find_files()
	-- 			end,
	-- 			desc = "Find Files",
	-- 		},
	-- 		{
	-- 			"<leader>gf",
	-- 			function()
	-- 				require("telescope.builtin").git_files()
	-- 			end,
	-- 			desc = "Git Files",
	-- 		},
	-- 		{
	-- 			"<leader>sg",
	-- 			function()
	-- 				require("telescope.builtin").live_grep()
	-- 			end,
	-- 			desc = "Live Grep",
	-- 		},
	-- 		{
	-- 			"<leader>fb",
	-- 			function()
	-- 				require("telescope.builtin").buffers()
	-- 			end,
	-- 			desc = "Buffers",
	-- 		},
	-- 		{
	-- 			"<leader>sw",
	-- 			function()
	-- 				require("telescope.builtin").grep_string()
	-- 			end,
	-- 			desc = "Grep String",
	-- 		},
	-- 		{
	-- 			"<leader>sd",
	-- 			function()
	-- 				require("telescope.builtin").diagnostics()
	-- 			end,
	-- 			desc = "Grep String",
	-- 		},
	-- 		{
	-- 			"<leader>fh",
	-- 			function()
	-- 				require("telescope.builtin").help_tags()
	-- 			end,
	-- 			desc = "Help Tags",
	-- 		},
	-- 	},
	-- },
}
