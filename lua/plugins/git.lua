vim.pack.add({
    { src = "https://github.com/NeogitOrg/neogit", branch = "master" }
})

local neogit = require('neogit')
neogit.setup({})

vim.keymap.set('n', '<leader>g', function() neogit.open() end)
