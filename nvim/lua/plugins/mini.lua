return {
	"nvim-mini/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 }) -- `:help mini.ai` for more info
		require("mini.surround").setup() -- `:help mini.surround` for more info

		require("mini.files").setup({})

		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })
	end,
}
