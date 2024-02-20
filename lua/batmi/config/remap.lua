local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- INSERT

-- BETTER ESCAPE
map("i", "jk", "<Esc>", {})
map("i", "kj", "<Esc>", {})

map("i", "<C-h>", "<Left>", {})
map("i", "<C-l>", "<Right>", {})
map("i", "<C-j", "<Down>", {})
map("i", "<C-k", "<Up>", {})

-- NORMAL

-- RELOAD CONFIG
map("n", "<leader>rl", ":source ~/.config/nvim/init.lua", {})

-- MAKE FILE EXECUTABLE
map("n", "<leader>0", ":!chmod +x % <CR>", {})

-- EXECUTE TMUX-SESSIONIZER
map("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", {})

-- CLEAR HIGHLIGHTS
map("n", "<Esc>", "<cmd> noh <CR>", {})

-- MOVING THROUGH WRAPPED LINES
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- UP A LINE
map("n", "J", "mzJ`z", {})

-- BETTER SCROLLING
map("n", "<C-d>", "<C-d>zz", {})
map("n", "<C-u>", "<C-u>zz", {})

-- BETTER UP/DOWN
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- BETTER SEARCH
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- RESIZE VERTICAL SPLIT
map("n", "<C-left>", ":vertical resize +3<CR>", {})
map("n", "<C-right>", ":vertical resize -3<CR>", {})


-- Copy to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], {})
map("n", "<leader>Y", [["+Y]], {})

map({ "n", "v" }, "<leader>d", [["_d]], {})


map("n", "Q", "<nop>", {})

-- REPLACE A WORD IN THE DOCUMENT
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Jumplist
map("n", "<C-m>", "<C-i>", {})

-- New tab
map("n", "te", ":tabedit<CR>", {})
map("n", "tc", ":tabclose<CR>", {})
map("n", "<tab>", ":tabnext<Return>", {})
map("n", "<s-tab>", ":tabprev<Return>", {})

-- Split window
map("n", "zs", ":split<Return>", {})
map("n", "zv", ":vsplit<Return>", {})

-- Diagnostics
map("n", "gl", vim.diagnostic.open_float, {})
map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)

-- LSP Keys
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }

    -- Snipetts
    map("n", "gfr", "<CMD>Lspsaga finder ref<CR>")
    map("n", "gfd", "<CMD>Lspsaga finder def<CR>")
    map("n", "gi", "<CMD>Lspsaga finder imp<CR>")
    map("n", "gca", "<CMD>Lspsaga code_action<CR>")
    map("n", "gd", "<CMD>Lspsaga peek_definition<CR>")
    map("n", "gtd", "<CMD>Lspsaga peek_type_definition<CR>")
    map("n", "gD", "<CMD>Lspsaga goto_definition<CR>")
    map("n", "gtD", "<CMD>Lspsaga goto_type_definition<CR>")
    map("n", "K", "<CMD>Lspsaga hover_doc ++keep<CR>")
    map("n", "grn", "<CMD>Lspsaga rename ++project<CR>")

    map("n", "gs", vim.lsp.buf.signature_help, opts)
    map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    map("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    -- Snippets
    local ls = require 'luasnip'
    map({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
    map({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
    map({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
    map({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
  end,
})

-- VISUAL

-- greatest remap ever
map("x", "<leader>p", [["_dP]], {})

-- MOVE LINES
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Better Scrolling
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- BETTER INDENTING
map("v", "<", "<gv")
map("v", ">", ">gv")
