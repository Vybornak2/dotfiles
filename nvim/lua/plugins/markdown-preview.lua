return {
	"selimacerbas/markdown-preview.nvim",
	dependencies = { "selimacerbas/live-server.nvim" },
	enabled = false, -- disabled by default
	cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
	opts = {
		instance_mode = "takeover",
		port = 0, -- 0 = auto (8421 for takeover, OS-assigned for multi)
		open_browser = true,
		debounce_ms = 300,
	},
}
