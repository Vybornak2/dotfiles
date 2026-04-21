--[[ LSP Keymaps ]]

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("keybinds-lsp-attach", { clear = true }),
	callback = function(event)
		local buf = event.buf

		-- LSP actions
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = buf, desc = "LSP: Rename" })
		vim.keymap.set({ "n", "x" }, "gra", vim.lsp.buf.code_action, { buffer = buf, desc = "LSP: Code Action" })

		-- Snacks picker-powered LSP navigation
		vim.keymap.set("n", "grr",
			function() Snacks.picker.lsp_references() end,
			{ buffer = buf, desc = "Goto References" })

		vim.keymap.set("n", "gri",
			function() Snacks.picker.lsp_implementations() end,
			{ buffer = buf, desc = "Goto Implementation" })

		vim.keymap.set("n", "grd",
			function() Snacks.picker.lsp_definitions() end,
			{ buffer = buf, desc = "Goto Definition" })

		vim.keymap.set("n", "gD",
			function() Snacks.picker.lsp_declarations() end,
			{ buffer = buf, desc = "Goto Declaration" })

		vim.keymap.set("n", "gO",
			function() Snacks.picker.lsp_symbols() end,
			{ buffer = buf, desc = "Open Document Symbols" })

		vim.keymap.set("n", "gW",
			function() Snacks.picker.lsp_workspace_symbols() end,
			{ buffer = buf, desc = "Open Workspace Symbols" })

		vim.keymap.set("n", "grt",
			function() Snacks.picker.lsp_type_definitions() end,
			{ buffer = buf, desc = "Goto Type Definition" })

		-- Inlay hints toggle (only if supported by the language server)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method("textDocument/inlayHint", buf) then
			vim.keymap.set("n", "<leader>th",
				function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf })) end,
				{ buffer = buf, desc = "Inlay Hints" })
		end
	end,
})
