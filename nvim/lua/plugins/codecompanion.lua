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

			strategies = {
				chat = {
					adapter = "copilot",
					keymaps = {
						-- This adds a specific keymap to swap models while chatting
						change_model = {
							modes = { n = "gm" }, -- 'gm' for "Go Model"
							description = "Change the AI model",
							callback = function(chat)
								require("codecompanion.interactions.chat.keymaps.change_adapter").select_model(chat)
							end,
						},
					},
				},
				inline = { adapter = "copilot" },
			},

			-- [[ 2. Set your default (GPT-5.3 is the March 2026 LTS) ]]
			adapters = {
				copilot = function()
					return require("codecompanion.adapters").extend("copilot", {
						schema = {
							model = {
								default = "gpt-5.3-codex",
							},
						},
					})
				end,
			},
		})
	end,
}
