vim.loader.enable()

require("settings.options")
require("settings.keymaps")
require("settings.autocmds")

require("plugins")

-- CHANGE THEMES
--
-- Nord
vim.cmd[[colorscheme nord]]
--
-- Zephyr
-- vim.cmd[[colorscheme zephyr]]
--
-- Oxocarbon
-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd.colorscheme "oxocarbon"

