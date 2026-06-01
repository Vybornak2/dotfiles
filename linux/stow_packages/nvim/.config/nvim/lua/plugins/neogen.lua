return {
    "danymat/neogen",
    cmd = "Neogen",
    opts = {
        snippet_engine = "nvim",
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
