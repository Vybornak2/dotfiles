return { -- Autocompletion
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				-- Build Step is needed for regex support in snippets.
				-- This step is not supported in many windows environments.
				-- Remove the below condition to re-enable on windows.
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				-- `friendly-snippets` contains a variety of premade snippets.
				--    See the README about individual language/framework/plugin snippets:
				--    https://github.com/rafamadriz/friendly-snippets
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			opts = {},
		},
	},
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			-- `:help ins-completion`
			-- :h blink-cmp-config-keymap
			-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
			-- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
			preset = "default",
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			trigger = {
				prefetch_on_insert = true,
			},
			ghost_text = {
				enabled = true,
			},
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
		},

		sources = {
			default = { "lsp", "path", "snippets", "codecompanion" },
			-- default = { "lsp", "path", "snippets", "copilot", "codecompanion" },
			providers = {
				-- Copilot suggestions are handled via `copilot.lua`
				-- enable correct `default` !!! if enabled
				-- copilot = {
				-- 	name = "copilot",
				-- 	module = "blink-cmp-copilot",
				-- 	min_keyword_length = 1,
				-- 	score_offset = 0,
				-- 	async = true,
				-- },
				codecompanion = {
					name = "CodeCompanion",
					module = "codecompanion.providers.completion.blink",
					enabled = true,
				},
			},
		},

		snippets = { preset = "luasnip" },
		fuzzy = { implementation = "prefer_rust_with_warning" },

		-- Shows a signature help window while you type arguments for a function
		signature = { enabled = true },
	},
}
