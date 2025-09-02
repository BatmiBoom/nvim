vim.lsp.enable({
	"clangd",
	"cssls",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"markdown_oxide",
	"ols",
	"pyrefly",
	"ruff",
	"rust_analyzer",
	"sqlls",
	"taplo",
	"ts_ls",
	"tailwindcss",
	"yamlls",
	"zls",
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- Create a floating terminal
local function open_floating_terminal()
	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = "minimal",
		border = "rounded",
	})

	vim.fn.jobstart("{term: v:true}")
	vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>t", function()
	open_floating_terminal()
end, {})
