local M = {}

function M.setup()
	vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
	vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Chat" })
	vim.keymap.set({ "n", "v" }, "<leader>ae", "<cmd>CodeCompanion<cr>", { desc = "AI Inline Edit" })
	vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add Selection to AI Chat" })
end

return M
