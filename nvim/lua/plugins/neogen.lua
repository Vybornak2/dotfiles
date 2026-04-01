return {
	"danymat/neogen",
	opts = {
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
	},
}
