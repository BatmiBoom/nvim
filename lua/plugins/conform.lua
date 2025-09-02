vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	notify_on_error = false,
	format_on_save = function()
		return {
			timeout_ms = 500,
			lsp_format = "fallback",
		}
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		ocaml = { "ocamlformat" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		svelte = { "prettierd" },
		yaml = { "prettierd" },
		graphql = { "prettierd" },
		markdown = { "prettierd" },
		gleam = { "gleam" },
		go = { "gofumpt", "goimports", "golines" },
		rust = { "rustfmt", lsp_format = "fallback" },
	},
})

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end)
