return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.g.lazygit_floating_window_winblend = 1 -- transparency of floating window
		vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
		vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
		vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
	end,
	keys = {
		{
			"<leader>gg",
			"<CMD>LazyGit<CR>",
		},
	},
}
