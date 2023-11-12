local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ import = "batmi.plugins" },
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
	       "tohtml",
	       "tutor",
	       "zipPlugin",
	       "matchparent",
	    },
	 },
      },
})
