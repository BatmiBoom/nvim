vim.g.mapleader = " "

vim.opt.compatible = false
vim.opt.title = false

vim.opt.nu = true
vim.opt.numberwidth = 2
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
vim.opt.autoindent = true

vim.opt.wrap = false
vim.opt.smoothscroll = true

vim.opt.fileencoding = "utf-8"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.signcolumn = "yes:1"
vim.opt.termguicolors = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 400

vim.opt.showmode = false
vim.opt.laststatus = 3

vim.opt.whichwrap:append '<>[]hl'

vim.opt.iskeyword:append("_")

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.cmdheight = 0

vim.opt.winbar = "%=%m %f"

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append({ c = true })

vim.g.markdown_recommended_style = 0

-- disable some default providers
for _, provider in ipairs { "perl", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.cmd("highlight WinSeparator guibg=None")
