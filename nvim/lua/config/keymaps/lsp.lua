--[[ LSP Keymaps ]]

local t_builtin = require("telescope.builtin")
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("keybinds-lsp-attach", { clear = true }),
	callback = function(event)
		local buf = event.buf
		local map = function(keys, func, desc, mode)
			vim.keymap.set(mode or "n", keys, func, { buffer = buf, desc = desc })
		end

		-- LSP actions
		map("grn", vim.lsp.buf.rename, "LSP: [R]e[n]ame")
		map("gra", vim.lsp.buf.code_action, "LSP: Code [A]ction", { "n", "x" })
		map("grD", vim.lsp.buf.declaration, "LSP: [G]oto [D]eclaration")

		-- Telescope-powered LSP navigation
		map("grr", t_builtin.lsp_references, "[G]oto [R]eferences")
		map("gri", t_builtin.lsp_implementations, "[G]oto [I]mplementation")
		map("grd", t_builtin.lsp_definitions, "[G]oto [D]efinition")
		map("gO", t_builtin.lsp_document_symbols, "Open Document Symbols")
		map("gW", t_builtin.lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
		map("grt", t_builtin.lsp_type_definitions, "[G]oto [T]ype Definition")

		-- Inlay hints toggle (only if supported by the language server)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method("textDocument/inlayHint", buf) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
			end, "Inlay [H]ints")
		end
	end,
})
