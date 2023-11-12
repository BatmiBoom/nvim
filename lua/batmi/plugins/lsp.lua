return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "lukas-reineke/cmp-rg" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			local cmp = require("cmp")

			require("luasnip.loaders.from_vscode").lazy_load()

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-x>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", group_index = 1 },
					{ name = "rg", group_index = 1 },
					{ name = "nvim_lua", group_index = 1 },
					{ name = "luasnip", group_index = 2 },
				}, {
					{ name = "path", max_item_count = 5 },
				}),
				enabled = function()
					local context = require("cmp.config.context")
					if vim.api.nvim_get_mode().mode == "c" then
						return true
					else
						return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
					end
				end,
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path", max_item_count = 5 },
				}, {
					{ name = "cmdline", max_item_count = 5 },
				}),
			})

			local lsp_installed = {
				"cssls",
				"clangd",
				"gopls",
				"html",
				"jsonls",
				-- "lua_ls",
				"marksman",
				"ols",
				-- "pyright",
				"ruff_lsp",
				-- "rust_analyzer",
				"sqlls",
				"tailwindcss",
				"taplo",
				-- "tsserver",
				"zls",
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
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
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			require("lspconfig").pyright.setup({
				capabilities = capabilities,
			})

			for _, lsp in pairs(lsp_installed) do
				require("lspconfig")[lsp].setup({
					capabilities = capabilities,
				})
			end
		end,
	},

	-- TYPESCRIPT
	{
		"pmizio/typescript-tools.nvim",
		event = { "BufReadPost *.js", "BufReadPost *.jsx", "BufReadPost *.ts", "BufReadPost *.tsx" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	-- RUST
	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = { "BufReadPost *.rs" },
		config = function()
			local rt = require("rust-tools")

			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						-- Hover actions
						vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
						-- Code action groups
						vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
				},
			})
		end,
	},

	-- BETTER SIGNATURE HELP
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		opts = {
			bind = true,
			handler_opts = {
				border = "single",
			},
			doc_lines = 5,
			toggle_key = "<C-k>",
			hint_enable = false,
		},
		config = function()
			vim.keymap.set({ "n" }, "<C-k>", function()
				require("lsp_signature").toggle_float_win()
			end, { silent = true, noremap = true, desc = "toggle signature" })

			vim.keymap.set({ "n" }, "<Leader>k", function()
				vim.lsp.buf.signature_help()
			end, { silent = true, noremap = true, desc = "toggle signature" })
		end,
	},

	-- PYTHON
	{
		"AckslD/swenv.nvim",
		config = function()
			require("swenv").setup({
				get_venvs = function(venvs_path)
					return require("swenv.api").get_venvs(venvs_path)
				end,
				venvs_path = "/Users/batmi/Library/Caches/pypoetry/virtualenvs/",
				post_set_venv = function()
					vim.cmd("LspRestart")
				end,
			})
		end,
		keys = {
			{
				"<leader>pv",
				mode = { "n" },
				function()
					require("swenv.api").pick_venv()
				end,
				desc = "Select Python Env",
			},
		},
	},
}
