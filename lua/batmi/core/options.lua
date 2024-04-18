vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.wildignore:append { '*.o', '*~', '*.pyc', '*pycache*' }
vim.opt.wildignore:append { 'Cargo.lock' }

vim.opt.pumblend = 17
vim.opt.wildmode = 'longest:full'
vim.opt.wildoptions = 'pum'

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

vim.opt.mouse = 'a'

vim.opt.diffopt = 'iwhite,filler'

vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3

vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true

vim.opt.backspace = 'indent,eol,start'

vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.wrap = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.equalalways = false
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 10
vim.opt.smoothscroll = true

vim.opt.hlsearch = true

vim.opt.breakindent = true
vim.opt.showbreak = string.rep(' ', 3)
vim.opt.linebreak = true

vim.opt.foldmethod = 'marker'
vim.opt.foldlevel = 0
vim.opt.modelines = 1

vim.opt.belloff = 'all'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.shada = { '!', "'1000", '<50', 's10', 'h' }

vim.opt.formatoptions:remove 'o'

vim.opt.joinspaces = false

vim.opt.fillchars = { eob = '~' }

vim.opt.diffopt = { 'internal', 'filler', 'closeoff', 'hiddenoff', 'algorithm:minimal' }

vim.opt.whichwrap:append '<>[]hl'
vim.opt.winbar = '%=%m %f'

vim.opt.shortmess:append { c = true }

-- if vim.fn.has 'win32' == 1 then
--   vim.opt.shell = 'nu.exe'
-- end

-- CURSOR LINE --
local group = vim.api.nvim_create_augroup('CursorLineControl', { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline('WinLeave', false)
set_cursorline('WinEnter', true)
set_cursorline('FileType', false, 'TelescopePrompt')

-- Disable some default PROVIDERS
for _, provider in ipairs { 'perl', 'ruby' } do
  vim.g['loaded_' .. provider .. '_provider'] = 0
end

vim.cmd 'highlight WinSeparator guibg=None'

-- CMP --
local cmptoggle = false
vim.g.cmptoggle = cmptoggle
