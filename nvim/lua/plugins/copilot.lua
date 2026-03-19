return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			-- Suggestions, panel handled via Avante
			suggestion = { enabled = false },
			panel = { enabled = false },
			-- Tell it exactly where your new Node v22 is if it gets confused
			-- copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v22.14.0/bin/node",
		})
	end,
}
