local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	print(" Bootstrapping lazy.nvim!")

	vim.cmd("!git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable " .. lazypath)

	print(" Done!")
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
	{ import = "plugins.specs" },
}, {
	defaults = {
		lazy = true,
		version = false,
	},
	install = {
		missing = true,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugins",
				"getscript",
				"getscriptPlugin",
				"logipat",
				"ftplugin",
				"gzip",
				"matchit",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
        "matchparent",
			},
		},
	},
})
