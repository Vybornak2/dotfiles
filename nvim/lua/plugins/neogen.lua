return {
	"danymat/neogen",
	config = true,
	config = function()
		require("neogen").setup({
			snippet_engine = "luasnip",
			languages = {
				python = {
					template = {
						annotation_convention = "google_docstrings",
					},
				},
				rust = {
					template = {
						annotation_convention = "rustdoc",
					},
				},
				cpp = {
					template = {
						annotation_convention = "doxygen",
					},
				},
				lua = {
					template = {
						annotation_convention = "emmylua",
					},
				},
			},
		})
	end,
}
