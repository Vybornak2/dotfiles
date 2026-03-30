return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter",
	---@module 'which-key'
	---@type wk.Opts
	---@diagnostic disable-next-line: missing-fields
	opts = {
		-- delay between pressing a key and opening which-key (milliseconds)
		delay = 0,
		icons = { mappings = vim.g.have_nerd_font },

		-- Document existing key chains
		spec = {
			{ "<leader>a", group = "[A]I", icon = "󰚩", mode = { "n", "v" } },
			{ "<leader>ac", group = "[C]LI", icon = "", mode = { "n", "v" } },
			{ "<leader>e", group = "[E]xplore", icon = "󰈙", mode = { "n" } },
			{ "<leader>g", group = "[G]it", icon = "", mode = { "n", "v" } },
			{ "<leader>n", group = "[N]eoVim", icon = "", mode = { "n", "v" } },
			{ "<leader>r", group = "[R]EPL", icon = "", mode = { "n", "v" } },
			{ "<leader>s", group = "[S]earch", icon = "", mode = { "n", "v" } },
			{ "<leader>t", group = "[T]oggle", icon = "", mode = { "n" } },
			{ "<leader>u", group = "[U]tils", icon = "", mode = { "n" } },
			{ "<leader>us", group = "[S]ession", icon = "󰆓", mode = { "n" } },

			{ "gr", group = "LSP Actions", icon = "", mode = { "n" } },
		},
	},
}
