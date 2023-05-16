vim.loader.enable()

require("plugins")

require("settings.options")
require("settings.keymaps")
require("settings.autocmds")

-- CHANGE THEMES
-- Abstract-IDE
-- vim.cmd[[colorscheme abscs]]
--
-- Aurora
-- vim.cmd[[colorscheme aurora]]
--
-- Nord
-- vim.cmd[[colorscheme nord]]
--
-- Zephyr
-- vim.cmd[[colorscheme zephyr]]
--
-- Oxocarbon
-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd.colorscheme "oxocarbon"

