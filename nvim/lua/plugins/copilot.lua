return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			-- Model is handled via `CodeCompanion`
			-- model = "gpt-4.1",
			suggestion = {
				enabled = false,
				auto_trigger = false,
				debounce = 15,
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
