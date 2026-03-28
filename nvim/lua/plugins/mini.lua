return {
	"nvim-mini/mini.nvim",
	config = function()
		require("mini.pairs").setup()
		require("mini.indentscope").setup()

		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		require("mini.files").setup({
			options = {
				use_as_default_explorer = true,
				permanent_delete = true,
			},
		})
	end,
}
