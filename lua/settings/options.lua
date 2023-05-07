-- #############################
-- #  0. Declaring variables.  #
-- #############################

-- Set local "o" to vim.opt.
local o = vim.opt

-- Set local "g" to vim.g.
local g = vim.g

-- ##############################
-- #         1. General         #
-- ##############################

o.swapfile = false
o.undofile = true
o.timeout = true
o.timeoutlen = 500
o.smartcase = true

-- ##############################
-- #         2. Editing         #
-- ##############################

o.autoindent = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.expandtab = true
o.jumpoptions = "stack"
o.mousemev = true
o.breakindent = true
o.linebreak = true
o.completeopt = "menu,menuone,noselect"
o.updatetime = 100

-- Unfofile
vim.schedule(function()
  o.undofile = true
end)

-- #############################
-- #           3. UI           #
-- #############################

o.number = true
o.relativenumber = true
o.cursorline = true
o.termguicolors = true
o.signcolumn = "yes"
o.ruler = false
o.gcr = {
  [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]],
  [[a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor]],
  [[sm:block-blinkwait175-blinkoff150-blinkon175]],
}
o.pumheight = 10
o.cmdheight = 0
o.scrolloff = 16
o.splitbelow = true
o.splitright = true
o.showmode = false
o.hlsearch = true
o.shortmess:append("c")
o.whichwrap:append("<,>,[,],h,l")
o.iskeyword:append("-")
o.formatoptions:remove({ "c", "r", "o" })

-- #############################
-- #           4. TOOLS        #
-- #############################
if vim.fn.executable("rg") == 1 then
  o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
  o.grepprg = "rg --vimgrep --no-heading --smart-case"
end
