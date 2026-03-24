return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			-- Suggestions, panel handled via Avante
			model = "gpt-4o",
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
