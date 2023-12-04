return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "nvimdev/epo.nvim" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local winhighlight = {
				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
			}

			require("luasnip.loaders.from_vscode").lazy_load()

			-- suggested completeopt
			vim.opt.completeopt = "menu,menuone,noselect"

			-- Color for completetion menu
			vim.api.nvim_set_hl(0, "Pmenu", { fg = "#E512E5", bg = nil })
			vim.api.nvim_set_hl(0, "PmenuExtra", { fg = "#000000", bg = "#ffffff" })
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#696fb5", fg = "#E512E5" })
			vim.api.nvim_set_hl(0, "PmenuKind", { fg = "#E5E512" })
			vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = "#33CE25", bg = "#b5696f" })
			vim.api.nvim_set_hl(0, "PmenuExtraSel", { fg = "#ffffff", bg = "#000000" })
			vim.api.nvim_set_hl(0, "PmenuSbar", { fg = "#ffffff", bg = "#000000" })

			local kind_icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰘧",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = " ",
				Unknown = " ",
			}

			require("epo").setup({
				fuzzy = true,
				debounce = 50,
				signature = true,
				snippet_path = nil,
				signature_border = "rounded",
				kind_format = function(k)
					return kind_icons[k] .. " " .. k
				end,
			})

			-- keys for completion
			vim.keymap.set("i", "<TAB>", function()
				if vim.fn.pumvisible() == 1 then
					return "<C-n>"
				elseif vim.snippet.jumpable(1) then
					return "<cmd>lua vim.snippet.jump(1)<cr>"
				else
					return "<TAB>"
				end
			end, { expr = true })

			vim.keymap.set("i", "<S-TAB>", function()
				if vim.fn.pumvisible() == 1 then
					return "<C-p>"
				elseif vim.snippet.jumpable(-1) then
					return "<cmd>lua vim.snippet.jump(-1)<CR>"
				else
					return "<S-TAB>"
				end
			end, { expr = true })

			vim.keymap.set("i", "<C-e>", function()
				if vim.fn.pumvisible() == 1 then
					require("epo").disable_trigger()
				end
				return "<C-e>"
			end, { expr = true })

			-- Enter as completition
			vim.keymap.set("i", "<cr>", function()
				if vim.fn.pumvisible() == 1 then
					return "<C-y>"
				end
				return "<cr>"
			end, { expr = true, noremap = true })

			-- autopairs
			vim.keymap.set("i", "<cr>", function()
				if vim.fn.pumvisible() == 1 then
					return vim.api.nvim_replace_termcodes("<C-y>", true, true, true)
				end
				return require("nvim-autopairs").autopairs_cr()
			end, { expr = true, noremap = true, replace_keycodes = false })
			require("nvim-autopairs").setup({ map_cr = false })

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
				"nim_langserver",
				"ocamllsp",
				"ols",
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

			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require("epo").register_cap()
			)

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
