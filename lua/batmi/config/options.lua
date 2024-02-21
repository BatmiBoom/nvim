vim.g.mapleader = " "

vim.opt.compatible = false
vim.opt.title = false

vim.opt.wildignore = "__pycache__"
vim.opt.wildignore:append { "*.o", "*~", "*.pyc", "*pycache*" }
vim.opt.wildignore:append { "Cargo.lock" }

vim.opt.termguicolors = true

vim.opt.pumblend = 17
vim.opt.wildmode = "longest:full"
vim.opt.wildoptions = "pum"

vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3

vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

vim.opt.equalalways = false
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.updatetime = 1000

vim.opt.hlsearch = true

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.smoothscroll = true

vim.opt.cursorline = true
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.wrap = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3)
vim.opt.linebreak = true

vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 0
vim.opt.modelines = 1

vim.opt.belloff = "all"

vim.opt.inccommand = "split"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.shada = { "!", "'1000", "<50", "s10", "h" }

vim.opt.formatoptions = vim.opt.formatoptions
    - "a"
    - "t"
    + "c"
    + "q"
    - "o"
    + "r"
    + "n"
    + "j"
    - "2"

vim.opt.joinspaces = false

vim.opt.fillchars = { eob = "~" }

vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }

vim.opt.undofile = true
vim.opt.signcolumn = "yes"

vim.opt.whichwrap:append '<>[]hl'
vim.opt.winbar = "%=%m %f"

vim.opt.shortmess:append({ c = true })

-- disable some default providers
for _, provider in ipairs { "perl", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.cmd("highlight WinSeparator guibg=None")
