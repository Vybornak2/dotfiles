return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "[G]it" },
	},
	config = function()
		-- Autocmd: Unlist Neogit plugin buffers
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"NeogitStatus",
				"NeogitPopup",
				"NeogitCommitMessage",
			},
			callback = function(args)
				vim.bo[args.buf].buflisted = false
				vim.bo[args.buf].bufhidden = "wipe"
			end,
		})
	end,
}
