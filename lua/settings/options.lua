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
o.shell = "zsh"

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
o.completeopt = "menuone,noselect,noinsert"
o.updatetime = 100
o.backspace = "indent,start,eol"
o.showmatch = true

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
o.pumheight = 10
o.cmdheight = 0
o.scrolloff = 8
o.splitbelow = true
o.splitright = true
o.showmode = false
o.hlsearch = true
o.shortmess:append("c")
o.iskeyword:append("-")
o.lazyredraw = true
o.listchars = {
  nbsp = "⦸",  -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
  extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
  precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
  tab = "  ",    -- '▷─' WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
  trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
  space = " ",
}
o.fillchars = {
  diff = "∙", -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
  eob = " ", -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
  fold = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  vert = "│", -- window border when window splits vertically ─ ┴ ┬ ┤ ├ ┼
}

-- #############################
-- #           4. TOOLS        #
-- #############################
if vim.fn.executable("rg") == 1 then
  o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
  o.grepprg = "rg --vimgrep --no-heading --smart-case"
end
