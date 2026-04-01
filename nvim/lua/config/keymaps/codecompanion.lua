--[[Code Companion Keymaps]]

vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "[A]ctions" })
vim.keymap.set("v", "<leader>ai", "<cmd>CodeCompanionChat Add<cr>", { desc = "[I]nsert" })
vim.keymap.set("v", "<leader>ae", ":'<,'>CodeCompanion<cr>", { desc = "[E]dit" })
vim.keymap.set("v", "<leader>ar", ":'<,'>CodeCompanion refactor this<cr>", { desc = "[R]efactor" })
vim.keymap.set({ "n", "v" }, "<leader>an", require("codecompanion").chat, { desc = "[N]ew chat" })
vim.keymap.set({ "n", "v" }, "<leader>at", require("codecompanion").toggle, { desc = "[T]oggle" })

-- CLI

local prompt_cli = function()
	return require("codecompanion").cli({ prompt = true })
end

local insert_cli = function()
	return require("codecompanion").cli("#{this}", { focus = false })
end

local diag_prompt_cli = function()
	return require("codecompanion").cli(
		"#{diagnostics} Can you fix these?",
		{ focus = false, submit = true }
	)
end

local term_prompt_cli = function()
	return require("codecompanion").cli(
		"#{terminal} Sharing the output from the terminal. Can you fix it?",
		{ focus = false, submit = true }
	)
end

vim.keymap.set({ "n", "v" }, "<leader>acp", prompt_cli, { desc = "[P]rompt" })
vim.keymap.set({ "n", "v" }, "<LocalLeader>aco", "<cmd>CodeCompanionCLI<cr>", { desc = "[O]pen" })
vim.keymap.set({ "n", "v" }, "<LocalLeader>aci", insert_cli, { desc = "[I]nsert" })
vim.keymap.set("n", "<LocalLeader>acd", diag_prompt_cli, { desc = "[D]iagnostics" })
vim.keymap.set("n", "<LocalLeader>act", term_prompt_cli, { desc = "[T]erminal" })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
