local M = {}

function M.setup()
	vim.keymap.set(
		{ "n", "v" },
		"<leader>aa",
		"<cmd>CodeCompanionActions<cr>",
		{ noremap = true, silent = true, desc = "[A]ctions" }
	)
	vim.keymap.set(
		"v",
		"<leader>ai",
		"<cmd>CodeCompanionChat Add<cr>",
		{ noremap = true, silent = true, desc = "[I]nsert" }
	)
	vim.keymap.set("v", "<leader>ae", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true, desc = "[E]dit" })

	vim.keymap.set({ "n", "v" }, "<leader>an", function()
		require("codecompanion").chat()
	end, { desc = "[N]ew chat" })

	vim.keymap.set({ "n", "v" }, "<leader>at", function()
		require("codecompanion").toggle()
	end, { desc = "[T]oggle" })

	vim.keymap.set({ "n", "v" }, "<leader>acp", function()
		return require("codecompanion").cli({ prompt = true })
	end, { desc = "[P]rompt" })

	vim.keymap.set({ "n", "v" }, "<LocalLeader>aco", function()
		vim.cmd("CodeCompanionCLI")
	end, { desc = "[O]pen" })

	vim.keymap.set({ "n", "v" }, "<LocalLeader>aci", function()
		return require("codecompanion").cli("#{this}", { focus = false })
	end, { desc = "[I]nsert" })

	-- [C]odeCompanion [D]iagnostics
	vim.keymap.set("n", "<LocalLeader>acd", function()
		return require("codecompanion").cli("#{diagnostics} Can you fix these?", { focus = false, submit = true })
	end, { desc = "[D]iagnostics" })

	-- [C]odeCompanion [T]erminal
	vim.keymap.set("n", "<LocalLeader>act", function()
		return require("codecompanion").cli(
			"#{terminal} Sharing the output from the terminal. Can you fix it?",
			{ focus = false, submit = true }
		)
	end, { desc = "[T]erminal" })

	-- Expand 'cc' into 'CodeCompanion' in the command line
	vim.cmd([[cab cc CodeCompanion]])
end

return M
