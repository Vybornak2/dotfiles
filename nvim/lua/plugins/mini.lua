return {
	"nvim-mini/mini.nvim",
	config = function()
		require("mini.pairs").setup()
		require("mini.indentscope").setup()

		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		require("mini.bufremove").setup()
		require("mini.files").setup({
			options = {
				use_as_default_explorer = true,
				permanent_delete = true,
			},
		})

		-- Autocmd: Unlist minifiles buffers
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "minifiles" },
			callback = function(args)
				vim.bo[args.buf].buflisted = false
				vim.bo[args.buf].bufhidden = "wipe"
			end,
		})
	end,
}
