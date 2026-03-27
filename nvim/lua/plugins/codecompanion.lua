return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			-- [[ 1. Enable the Settings Header to see the current model ]]
			display = {
				chat = {
					show_settings = true,
				},
			},
			-- opts = {
			-- 	log_level = "DEBUG", -- TRACE|DEBUG|ERROR|INFO
			-- },
			strategies = {
				chat = {
					adapter = {
						name = "copilot",
						-- model = "gpt-5.3-codex",
						model = "gpt-4.1",
					},
					keymaps = {
						change_model = {
							modes = { n = "<leader>am" },
							description = "Change the AI model",
							callback = function(chat)
								require("codecompanion.interactions.chat.keymaps.change_adapter").select_model(chat)
							end,
						},
					},
				},
				inline = {
					adapter = {
						name = "copilot",
						-- model = "gpt-4.1",
						model = "gpt-5.3-codex",
					},
				},
			},
			adapters = {
				acp = {
					gemini_cli = function()
						return require("codecompanion.adapters").extend("gemini_cli", {
							defaults = {
								auth_method = "oauth-personal", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
							},
							-- env = { GEMINI_API_KEY = "cmd:op read op://personal/Gemini_API/credential --no-newline" },
						})
					end,
				},
			},
		})
	end,
}
