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
			{ "saadparwaiz1/cmp_luasnip" },
			{
				"Saecki/crates.nvim",
				event = { "BufRead Cargo.toml" },
				opts = {
					src = {
						cmp = { enabled = true },
					},
				},
			},
			{ "lukas-reineke/cmp-under-comparator" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "folke/neodev.nvim" },
			{ "windwp/nvim-autopairs" },
		},
		config = function()
			vim.api.nvim_set_hl(0, "CmpGhoshText", { link = "Comment", default = true })
			local winhighlight = {
				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
			}

			require("luasnip.loaders.from_vscode").lazy_load()

			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(winhighlight),
					documentation = cmp.config.window.bordered(winhighlight),
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
					{ name = "nvim_lua", group_index = 1 },
					{ name = "luasnip", group_index = 2 },
					{ name = "crates" },
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
				experimental = {
					native_menu = false,
					ghost_text = {
						hl_group = "CmpGhoshText",
					},
				},
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						require("cmp-under-comparator").under,
						cmp.config.compare.kind,
					},
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path", max_item_count = 5 },
				}, {
					{ name = "cmdline", max_item_count = 5 },
				}),
			})
			--
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			--
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

			local lsp_installed = {
				"astro",
				"cssls",
				"clangd",
				"cmake",
				"dockerls",
				"elixirls",
				"gopls",
				"html",
				"htmx",
				"jsonls",
				-- "lua_ls",
				"marksman",
				"neocmake",
				"ocamllsp",
				-- "pyright",
				"ruff_lsp",
				-- "rust_analyzer",
				"sqlls",
				"svelte",
				"tailwindcss",
				"taplo",
				-- "tsserver",
				"zls",
			}

			require("neodev").setup({})

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

			require("lspconfig").ols.setup({})

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
	{
		"ray-x/lsp_signature.nvim", -- show hints when writing function arguments
		event = { "InsertEnter" },
		opts = {
			bind = true,
			noice = true,
			max_height = 20,
			zindex = 1,
			always_trigger = true,
			floating_window_above_cur_line = true,
			floating_window_off_x = function(info)
				local cur_pos = vim.api.nvim_win_get_cursor(0)[2] + 1
				local x_off = info.x_off or -vim.trim(vim.api.nvim_get_current_line():sub(1, cur_pos)):len()
				local win_width = vim.api.nvim_win_get_width(0) - 4
				local origin = math.min(120, win_width)
				return origin - x_off - cur_pos
			end,
			extra_trigger_chars = { "(", ",", "\n" },
		},
	},

	-- PYTHON
	{
		"stevanmilic/nvim-lspimport",
		ft = { "python" },
	},
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
