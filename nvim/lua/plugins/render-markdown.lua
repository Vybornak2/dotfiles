return {
	"MeanderingProgrammer/render-markdown.nvim",
    event = "BufWinEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown", "codecompanion" },
	opts = {
		file_types = { "markdown", "codecompanion" },
	},
}
