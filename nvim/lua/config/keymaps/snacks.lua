local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>et", function()
		require("snacks.explorer").open()
	end, { desc = "[T]oggle" })

	vim.keymap.set("n", "<leader>el", function()
		require("snacks.explorer").reveal()
	end, { desc = "[R]eveal" })
end

return M
