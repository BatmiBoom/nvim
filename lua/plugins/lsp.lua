return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
			{
				"williamboman/mason.nvim",
				opt = {
					ensure_installed = {
						"stylua",
						"black",
						"eslint_d",
					},
				},
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"VonHeikemen/lsp-zero.nvim",
				branch = "dev-v3",
				lazy = true,
				config = false,
			},
			{
				"hrsh7th/nvim-cmp",
				dependencies = {
					{ "L3MON4D3/LuaSnip" },
				},
			},
		},
		config = function()
			local lsp = require("lsp-zero").preset({})

			lsp.extend_cmp()

			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-x>"] = cmp.mapping.complete(),
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
				},
				sources = {
					{ name = "nvim_lsp", max_item_count = 8, group_index = 1 },
					{ name = "nvim_lua", max_item_count = 4, group_index = 1 },
					{ name = "luasnip", max_item_count = 4, group_index = 2 },
					{ name = "buffer", max_item_count = 4, keyword_length = 4, group_index = 3 },
				},
			})
			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr }) -- add lsp-zero defaults

				local opts = { buffer = bufnr }
				local bind = vim.keymap.set

				bind("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				bind("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
				bind("n", "<leader>cd", "<cmd>lua vim.lsp.buf.code_action<cr>", opts)
			end)

			-- K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
			-- gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
			-- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
			-- gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
			-- go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
			-- gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
			-- gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
			-- gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
			-- [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
			-- ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"tsserver",
					"rust_analyzer",
					"tailwindcss",
					"cssls",
					"clangd",
					"gopls",
					"eslint",
					"html",
					"jsonls",
					"marksman",
					"ols",
					"sqlls",
					"taplo",
				},
				handlers = {
					lsp.default_setup,
					lua_ls = function()
						-- (Optional) configure lua language server
						require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
					end,
				},
			})
		end,
	},
}
