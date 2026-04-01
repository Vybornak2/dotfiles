return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
	config = function()
		local parsers = {
			"bash",
			"c",
			"cmake",
			"comment",
			"cpp",
			"diff",
			"gitignore",
			"html",
			"json",
			"jsonc",
			"latex",
			"lua",
			"luadoc",
			"make",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"rust",
			"toml",
			"vim",
			"vimdoc",
			"yaml",
		}
		require("nvim-treesitter").install(parsers)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = parsers,
			callback = function(args)
				local buf, filetype = args.buf, args.match

				local language = vim.treesitter.language.get_lang(filetype)
				if not language then
					return
				end

				if not vim.treesitter.language.add(language) then
					return
				end
				vim.treesitter.start(buf, language)

				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"

				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
