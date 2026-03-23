return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
		})
		vim.cmd.colorscheme("catppuccin-nvim")
	end,
}