vim.pack.add({ "https://github.com/mason-org/mason.nvim" })

require("mason").setup()

local ensure_installed = {
	-- SERVERS
	"clangd",
	"css-lsp",
	"gopls",
	"html-lsp",
	"json-lsp",
	"pyrefly",
	"rust-analyzer",
	"typescript-language-server",
	"lua-language-server",
	"markdown-oxide",
	"ruff",
	"ols",
	"sqlls",
	"taplo",
	"tailwindcss-language-server",
	"yaml-language-server",
	"zls",
	-- FORMATTERS
	"stylua",
	"prettierd",
	"gofumpt",
	"goimports",
	"golines",
	-- LINTERS
	"biome",
	"golangci-lint",
}
