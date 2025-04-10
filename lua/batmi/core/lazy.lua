local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'custom.plugins' },
  require 'custom.plugins.lsp.lua',
  require 'custom.plugins.lsp',
}, {
  defaults = {
    lazy = true,
    version = false,
  },
  dev = {
    path = 'C:\\Users\\nstir\\workspace\\github.com\\batmikun\\plugins',
    fallback = false,
  },
  install = {
    missing = true,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        'gzip',
        'zip',
        'zipPlugin',
        'tar',
        'tarPlugin',

        'getscript',
        'getscriptPlugin',
        'vimball',
        'vimballPlugin',
        '2html_plugin',

        'matchit',
        'matchparen',
        'logiPat',
        'rrhelper',

        'netrw',
        'netrwPlugin',
        'netrwSettings',

        'spellfile',
        'tohtml',
        'tutor',
      },
    },
  },
  change_detection = {
    enabled = false,
    notify = false, -- get a notification when changes are found
  },
  ui = {
    icons = {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      source = '📄',
      start = '🚀',
      task = '📌',
    },
  },
})
