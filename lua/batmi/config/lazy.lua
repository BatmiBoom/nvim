local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
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
  dev = {
    path = "~/workspace/nvim/plugins",
    fallback = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true,        -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {},          -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        "gzip",
        "zip",
        "zipPlugin",
        "tar",
        "tarPlugin",

        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "2html_plugin",

        "matchit",
        "matchparen",
        "logiPat",
        "rrhelper",

        "netrw",
        "netrwPlugin",
        "netrwSettings",
      },
    },
  },
  change_detection = {
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
    },
  },
})
