--[[Copilot keymaps]]

vim.keymap.set("i", "<M-y>", function()
	require("copilot.suggestion").accept()
end, { desc = "Accept Copilot suggestion" })

vim.keymap.set("i", "<M-n>", function()
	require("copilot.suggestion").next()
end, { desc = "Next Copilot suggestion" })

vim.keymap.set("i", "<M-p>", function()
	require("copilot.suggestion").prev()
end, { desc = "Previous Copilot suggestion" })

vim.keymap.set("i", "<M-e>", function()
	require("copilot.suggestion").dismiss()
end, { desc = "Dismiss Copilot suggestion" })

vim.keymap.set("n", "<leader>tc", function()
	require("copilot.suggestion").toggle_auto_trigger()
end, { desc = "[C]opilot Suggestions" })
