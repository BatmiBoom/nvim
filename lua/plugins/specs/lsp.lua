return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"b0o/SchemaStore.nvim",
			"jose-elias-alvarez/typescript.nvim",
			"simrat39/rust-tools.nvim",
		},
		---@class PluginLspOpts
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = false,
				severity_sort = true,
			},
		},
		config = function(_, opts)
			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

			require("mason").setup()
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local buff = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, buff)
					vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", buff)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, buff)
					vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", buff)
					vim.keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", buff)
					vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, buff)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, buff)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, buff)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, buff)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, buff)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, buff)
					vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", buff)
					vim.keymap.set("n", "<space>f", function()
						vim.lsp.buf.format({ async = true })
					end, buff)
				end,
			})
			local mlsp = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			mlsp.setup({
				ensure_installed = {
					"clangd",
					"cssls",
					"gopls",
					"html",
					"jsonls",
					"lua_ls",
					"marksman",
					"pyright",
					"rust_analyzer",
					"svelte",
					"tsserver",
					"taplo",
					"yamlls",
					"zls",
				},
				automatic_installtion = true,
			})
			mlsp.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["jsonls"] = function()
					lspconfig.jsonls.setup({
						on_new_config = function(new_config)
							new_config.settings.json.schemas = new_config.settings.json.schemas or {}
							vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
						end,
						settings = {
							json = {
								format = {
									enable = true,
								},
								validate = { enable = true },
							},
						},
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						single_file_support = true,
						settings = {
							Lua = {
								workspace = {
									checkThirdParty = false,
								},
								completion = {
									callSnippet = "Replace",
								},
                diagnostics = {
                  enable = true,
                  globals = { "hs", "vim", "it", "describe", "before_each", "after_each" },
                  disable = { "lowercase-global" }
            },
							},
						},
					})
				end,
				["gopls"] = function()
					lspconfig.gopls.setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								experimentalPostfixCompletions = true,
								analyses = {
									unusedparams = true,
									shadow = true,
								},
								staticcheck = true,
							},
						},
						init_options = {
							usePlaceholders = true,
						},
					})
				end,
				["tsserver"] = function()
					require("typescript").setup({
						server = {
							capabilities = capabilities,
							on_attach = {
								vim.keymap.set(
									"n",
									"<leader>co",
									"<cmd>TypescriptOrganizeImports<CR>",
									{ buffer = buffer, desc = "Organize Imports" }
								),
								vim.keymap.set(
									"n",
									"<leader>cR",
									"<cmd>TypescriptRenameFile<CR>",
									{ desc = "Rename File", buffer = buffer }
								),
							},
							settings = {
								typescript = {
									format = {
										indentSize = vim.o.shiftwidth,
										convertTabsToSpaces = vim.o.expandtab,
										tabSize = vim.o.tabstop,
									},
								},
								javascript = {
									format = {
										indentSize = vim.o.shiftwidth,
										convertTabsToSpaces = vim.o.expandtab,
										tabSize = vim.o.tabstop,
									},
								},
								completions = {
									completeFunctionCalls = true,
								},
							},
						},
					})
				end,
				["rust_analyzer"] = function()
					local rt = require("rust-tools")
					rt.setup({
						tools = {
							inlay_hints = {
								auto = true,
								only_current_line = false,
								show_parameter_hints = true,
								parameter_hints_prefix = "<- ",
								other_hints_prefix = "=> ",
								max_len_align = false,
								max_len_align_padding = 1,
								right_align = false,
								right_align_padding = 7,
								highlight = "Comment",
							},
						},
						server = {
							standalone = true,
							on_attach = function(_, bufnr)
								vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
								vim.keymap.set(
									"n",
									"<Leader>ca",
									rt.code_action_group.code_action_group,
									{ buffer = bufnr }
								)
							end,
							["rust-analyzer"] = {
								procMacro = { enable = true },
								cargo = { allFeatures = true },
								checkOnSave = {
									command = "clippy",
									extraArgs = { "--no-deps" },
								},
							},
						},
					})
				end,
				["yamlls"] = function()
					lspconfig.yamlls.setup({
						capabilities = capabilities,
						settings = {
							yaml = {
								keyOrdering = false,
							},
						},
					})
				end,
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.black,
					require("typescript.extensions.null-ls.code-actions"),
				},
			}
		end,
		keys = {
			{ "<leader>lt", vim.lsp.buf.format },
		},
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"black",
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
}
