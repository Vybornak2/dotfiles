return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	lazy = false,
	priority = 1000,
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
	end,
	config = function()
		-- Direct call to verify pathing
		local ok, configs = pcall(require, "nvim-treesitter.configs")
		if not ok then
			vim.notify("Treesitter module not found in RTP", vim.log.levels.ERROR)
			return
		end
		configs.setup({
			ensure_installed = {
				"bash", "c", "python", "diff", "html", "comment", "lua", "luadoc",
				"markdown", "markdown_inline", "query", "vim", "regex", "vimdoc",
				"latex", "yaml",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
