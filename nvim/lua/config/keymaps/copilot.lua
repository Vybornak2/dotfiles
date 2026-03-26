--[[Copilot keymaps]]

local M = {}

function M.setup()
	local csg = require("copilot.suggestion")

	vim.keymap.set("i", "<M-y>", function()
		csg.accept()
	end, { desc = "Accept Copilot suggestion" })

	vim.keymap.set("i", "<M-n>", function()
		csg.next()
	end, { desc = "Next Copilot suggestion" })

	vim.keymap.set("i", "<M-p>", function()
		csg.prev()
	end, { desc = "Previous Copilot suggestion" })

	vim.keymap.set("i", "<M-e>", function()
		csg.dismiss()
	end, { desc = "Dismiss Copilot suggestion" })

	vim.keymap.set("n", "<leader>tc", function()
		csg.toggle_auto_trigger()
	end, { desc = "[C]opilot Suggestions" })
end

return M
