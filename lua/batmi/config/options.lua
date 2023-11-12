vim.g.mapleader = " "

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3

vim.opt.title = true
vim.cmd('set path+=**')

vim.opt.compatible = false

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.fileencoding = "utf-8"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "95"

vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.laststatus = 3
--vim.cmd "highlight WinSeparator guibg=None"

vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.splitbelow = true
vim.opt.splitright = true
