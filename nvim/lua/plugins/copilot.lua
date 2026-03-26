return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			-- Model is handled via `CodeCompanion`
			-- model = "gpt-4.1",
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 15,
				trigger_on_accept = true,
				keymap = {
					accept_word = false,
					accept_line = false,
					toggle_auto_trigger = false,
				},
			},
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				python = true,
				rust = true,
				lua = true,
			},
			-- logger = {
			-- 	file_log_level = vim.log.levels.DEBUG,
			-- 	print_log_level = vim.log.levels.DEBUG,
			-- },
		})
	end,
}
