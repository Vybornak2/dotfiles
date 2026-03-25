local M = {}

function M.setup()
	vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "[A]ctions" })
	vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "[C]hat" })
	vim.keymap.set({ "n", "v" }, "<leader>ae", "<cmd>CodeCompanion<cr>", { desc = "[E]dit inline" })

	vim.keymap.set(
		"v",
		"<leader>ai",
		"<cmd>CodeCompanionChat Add<cr>",
		{ noremap = true, silent = true, desc = "[I]nsert Selection" }
	)
end

return M
