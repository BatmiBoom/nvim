vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.pick" },
    { src = 'https://github.com/nvim-mini/mini.surround' },
    { src = 'https://github.com/nvim-mini/mini.files' },
    { src = 'https://github.com/nvim-mini/mini.tabline' }
})
require("mini.pick").setup({ -- Keys for performing actions. See `:h MiniPick-actions`.
    mappings = {
        caret_left        = '<Left>',
        caret_right       = '<Right>',

        choose            = '<CR>',
        choose_in_split   = '<C-s>',
        choose_in_tabpage = '<C-t>',
        choose_in_vsplit  = '<C-v>',
        choose_marked     = '<M-CR>',

        delete_char       = '<BS>',
        delete_char_right = '<Del>',
        delete_left       = '<C-u>',
        delete_word       = '<C-w>',

        mark              = '<C-x>',
        mark_all          = '<C-a>',

        move_down         = '<C-n>',
        move_start        = '<C-g>',
        move_up           = '<C-p>',

        paste             = '<C-r>',

        refine            = '<C-Space>',
        refine_marked     = '<M-Space>',

        scroll_down       = '<C-f>',
        scroll_left       = '<C-h>',
        scroll_right      = '<C-l>',
        scroll_up         = '<C-b>',

        stop              = '<Esc>',

        toggle_info       = '<S-Tab>',
        toggle_preview    = '<Tab>',
    },
    window = {
        config = nil,
        prompt_caret = '▏',
        prompt_prefix = '> ',
    },
})

require('mini.surround').setup({
    mappings = {
        add = 'ya',            -- Add surrounding in Normal and Visual modes
        delete = 'yd',         -- Delete surrounding
        find = 'yf',           -- Find surrounding (to the right)
        find_left = 'yF',      -- Find surrounding (to the left)
        highlight = 'yh',      -- Highlight surrounding
        replace = 'yr',        -- Replace surrounding
        update_n_lines = 'yn', -- Update `n_lines`

        suffix_last = 'l',     -- Suffix to search with "prev" method
        suffix_next = 'n',     -- Suffix to search with "next" method
    },
})

require('mini.files').setup()
require('mini.tabline').setup()

vim.keymap.set("n", "<leader>f", ":Pick files<CR>", { desc = "File Picker" })
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>", { desc = "Buffer Picker" })
vim.keymap.set("n", "<leader>/", ":Pick grep_live<CR>", { desc = "Grep Picker" })
vim.keymap.set("n", "<leader>h", ":Pick help<CR>", { desc = "Help Picker" })
vim.keymap.set("n", "<leader>r", ":Pick resume<CR>", { desc = "Resumes Picker" })

vim.keymap.set("n", "-", function()
    require('mini.files').open()
end, { desc = "File Tree" })
