vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })
vim.pack.add({ "https://github.com/saghen/blink.cmp" })
vim.pack.add({ "https://github.com/L3MON4D3/LuaSnip" })
vim.pack.add({ "https://github.com/rafamadriz/friendly-snippets" })

require("blink.cmp").setup({
	keymap = {
		preset = "default",
	},
	completion = {
		menu = {
			border = "single",
			draw = {
				components = {
					kind_icon = {
						text = function(ctx)
							local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
							return kind_icon
						end,
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
					kind = {
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
				},
			},
		},
		documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = "single" } },
	},
	sources = {
		providers = {
			lsp = {
				name = "LSP",
				module = "blink.cmp.sources.lsp",
			},
		},
		default = { "lsp", "path", "snippets" },
	},
	snippets = { preset = "luasnip" },
	fuzzy = { implementation = "lua", sorts = { "exact", "score", "sort_text" } },
	signature = { enabled = true },
})

require("luasnip.loaders.from_vscode").lazy_load()
