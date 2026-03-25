return {
	"Vigemus/iron.nvim",
	name = "iron",
	build = "helptags ALL",
	config = function()
		local view = require("iron.view")
		local common = require("iron.fts.common")

		require("iron").setup({
			config = {
				scratch_repl = true,
				repl_definition = {
					sh = {
						command = { "zsh" },
					},
					python = {
						command = { "ipython", "--no-autoindent" },
						format = common.bracketed_paste_python,
						block_dividers = { "# %%", "#%%" },
					},
				},
				repl_filetype = function(bufnr, ft)
					return ft
				end,
				dap_integration = true,
				repl_open_cmd = view.bottom(40),

				-- repl_open_cmd = {
				--   view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
				--   view.split.rightbelow("%25")  -- cmd_2: open a repl below
				-- }
			},

			-- Iron doesn't set keymaps by default anymore.
			-- keymaps = require("config.keymaps.iron"),
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
		})
	end,
}
