vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

local lint = require("lint")
lint.linters_by_ft = {
	javascript = { "biomejs" },
	typescript = { "biomejs" },
	javascriptreact = { "biomejs" },
	typescriptreact = { "biomejs" },
	golang = { "golangcilint" },
	rust = { "clippy" },
	python = { "ruff" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
	group = lint_augroup,
	callback = function()
		if vim.opt_local.modifiable:get() then
			lint.try_lint()
		end
	end,
})
