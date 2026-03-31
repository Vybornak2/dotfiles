--[[NeoGen]]

local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>cng", function()
		require("neogen").generate()
	end, { desc = "[G]enerate annotation" })

	vim.keymap.set("i", "<leader>cnn", function()
		require("neogen").jump_next()
	end, { desc = "[N]ext Jump" })

	vim.keymap.set("i", "<leader>cnp", function()
		require("neogen").jump_prev()
	end, { decs = "[P]revious Jump" })
end

return M
