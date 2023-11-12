local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- RELOAD CONFIG
map("n", "<leader>rl", ":source ~/.config/nvim/init.lua", {})

-- OPEN NETRW
map("n", "<leader>e", ":25Lex<CR>", {})

-- MAKE FILE EXECUTABLE
map("n", "<leader>x", ":!chmod +x %", {})

-- EXECUTE TMUX-SESSIONIZER
map("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", {})

-- MOVE LINES
map("v", "J", ":m '>+1<CR>gv=gv", {})
map("v", "K", ":m '<-2<CR>gv=gv", {})

-- UP A LINE
map("n", "J", "mzJ`z", {})

-- BETTER SCROLLING
map("n", "<C-d>", "<C-d>zz", {})
map("n", "<C-u>", "<C-u>zz", {})

-- BETTER SEARCH
map("n", "n", "nzzzv", {})
map("n", "N", "Nzzzv", {})

-- RESIZE VERTICAL SPLIT
map("n", "<C-left>", ":vertical resize +3<CR>", {})
map("n", "<C-right>", ":vertical resize -3<CR>", {})

-- greatest remap ever
map("x", "<leader>p", [["_dP]], {})

-- next greatest remap ever : asbjornHaland
map({"n", "v"}, "<leader>y", [["+y]], {})
map("n", "<leader>Y", [["+Y]], {})

map({"n", "v"}, "<leader>d", [["_d]], {})

-- BETTER ESCAPE
map("i", "jk", "<Esc>", {})
map("i", "kj", "<Esc>", {})

map("n", "Q", "<nop>", {})

-- VIEW ERROR DIAGNOSTICS
map("n", "<leader>k", "<cmd>lnext<CR>zz", {})
map("n", "<leader>j", "<cmd>lprev<CR>zz", {})

-- REPLACE A WORD IN THE DOCUMENT
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})

-- Refactoring
map("x", "<leader>re", ":Refactor extract ", {})
map("x", "<leader>rf", ":Refactor extract_to_file ", {})
map("x", "<leader>rv", ":Refactor extract_var ", {})
map({ "n", "x" }, "<leader>ri", ":Refactor inline_var", {})
map( "n", "<leader>rI", ":Refactor inline_func", {})
map("n", "<leader>rb", ":Refactor extract_block", {})
map("n", "<leader>rbf", ":Refactor extract_block_to_file", {})

-- Diagnostics Keys
map('n', 'gl', vim.diagnostic.open_float, {})
map('n', '[d', vim.diagnostic.goto_next, {})
map('n', ']d', vim.diagnostic.goto_prev, {})
map('n', '<space>sl', vim.diagnostic.setloclist, {})

-- LSP Keys
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', 'gs', vim.lsp.buf.signature_help, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', 'gt', vim.lsp.buf.type_definition, opts)

    map('n', '<space>rn', vim.lsp.buf.rename, opts)
    map({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    map('n', '<space>cf', function(args)
      require("conform").format({ bufnr = args.buf, async = true })
    end, opts)

    map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    map('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
  end,
})
