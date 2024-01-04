local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- RELOAD CONFIG
map("n", "<leader>rl", ":source ~/.config/nvim/init.lua", {})

-- MAKE FILE EXECUTABLE
map("n", "<leader>x", ":!chmod +x %", {})

-- EXECUTE TMUX-SESSIONIZER
map("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", {})

-- MOVE LINES
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
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

-- BETTER INDENTING
map("v", "<", "<gv")
map("v", ">", ">gv")

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

-- greatest remap ever
map("x", "<leader>p", [["_dP]], {})

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]], {})
map("n", "<leader>Y", [["+Y]], {})

map({ "n", "v" }, "<leader>d", [["_d]], {})

-- BETTER ESCAPE
map("i", "jk", "<Esc>", {})
map("i", "kj", "<Esc>", {})

map("n", "Q", "<nop>", {})

-- REPLACE A WORD IN THE DOCUMENT
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})

-- Refactoring
map("x", "<leader>re", ":Refactor extract ", {})
map("x", "<leader>rf", ":Refactor extract_to_file ", {})
map("x", "<leader>rv", ":Refactor extract_var ", {})
map({ "n", "x" }, "<leader>ri", ":Refactor inline_var", {})
map("n", "<leader>rI", ":Refactor inline_func", {})
map("n", "<leader>rb", ":Refactor extract_block", {})
map("n", "<leader>rbf", ":Refactor extract_block_to_file", {})

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Jumplist
map("n", "<C-m>", "<C-i>", {})

-- New tab
map("n", "te", ":tabedit<CR>", {})
map("n", "tc", ":tabclose<CR>", {})
map("n", "<tab>", ":tabnext<Return>", {})
map("n", "<s-tab>", ":tabprev<Return>", {})

-- term
map("n", "<leader>te", ":term<CR>", {})

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

		map("n", "mfr", "<CMD>Lspsaga finder ref<CR>")
		map("n", "mfd", "<CMD>Lspsaga finder def<CR>")
		map("n", "gi", "<CMD>Lspsaga finder imp<CR>")
		map("n", "mca", "<CMD>Lspsaga code_action<CR>")
		map("n", "gd", "<CMD>Lspsaga peek_definition<CR>")
		map("n", "gtd", "<CMD>Lspsaga peek_type_definition<CR>")
		map("n", "gD", "<CMD>Lspsaga goto_definition<CR>")
		map("n", "gtD", "<CMD>Lspsaga goto_type_definition<CR>")
		map("n", "K", "<CMD>Lspsaga hover_doc ++keep<CR>")
		map("n", "mrn", "<CMD>Lspsaga rename ++project<CR>")

		map("n", "gs", vim.lsp.buf.signature_help, opts)
		map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		map("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
	end,
})
