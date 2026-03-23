-- [[ Keybindings ]]
-- All keybindings are defined here as a single source of truth.
-- Plugin requires are deferred inside callbacks to preserve lazy loading.

local M = {}

function M.setup()
	local t_builtin = require("telescope.builtin")

	-- [[ General ]]
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
	vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

	-- Arrow key hints
	vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
	vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
	vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
	vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

	-- [[ Window Navigation ]]
	-- See `:help wincmd`
	vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

	-- [[ Diagnostics ]]
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

	-- [[ Format (conform.nvim) ]]
	vim.keymap.set("", "<leader>f", function()
		require("conform").format({ async = true, lsp_format = "fallback" })
	end, { desc = "[F]ormat buffer" })

	-- [[ Telescope ]]
	-- See `:help telescope.builtin`
	vim.keymap.set("n", "<leader>sh", t_builtin.help_tags, { desc = "[S]earch [H]elp" })
	vim.keymap.set("n", "<leader>sk", t_builtin.keymaps, { desc = "[S]earch [K]eymaps" })
	vim.keymap.set("n", "<leader>sf", t_builtin.find_files, { desc = "[S]earch [F]iles" })
	vim.keymap.set("n", "<leader>ss", t_builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
	vim.keymap.set({ "n", "v" }, "<leader>sw", t_builtin.grep_string, { desc = "[S]earch current [W]ord" })
	vim.keymap.set("n", "<leader>sg", t_builtin.live_grep, { desc = "[S]earch by [G]rep" })
	vim.keymap.set("n", "<leader>sd", t_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
	vim.keymap.set("n", "<leader>sr", t_builtin.resume, { desc = "[S]earch [R]esume" })
	vim.keymap.set("n", "<leader>s.", t_builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
	vim.keymap.set("n", "<leader>sc", t_builtin.commands, { desc = "[S]earch [C]ommands" })
	vim.keymap.set("n", "<leader><leader>", t_builtin.buffers, { desc = "[ ] Find existing buffers" })

	vim.keymap.set("n", "<leader>/", function()
		t_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, { desc = "[/] Fuzzily search in current buffer" })

	vim.keymap.set("n", "<leader>s/", function()
		t_builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
	end, { desc = "[S]earch [/] in Open Files" })

	vim.keymap.set("n", "<leader>sn", function()
		t_builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "[S]earch [N]eovim files" })

	-- [[ AI / CodeCompanion ]]
	vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
	vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Chat" })
	vim.keymap.set({ "n", "v" }, "<leader>ae", "<cmd>CodeCompanion<cr>", { desc = "AI Inline Edit" })
	vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add Selection to AI Chat" })

	-- [[ LSP (buffer-local, set on LspAttach) ]]
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
				end, "LSP: [T]oggle Inlay [H]ints")
			end
		end,
	})
end

return M
