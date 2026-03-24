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

	-- [[ Neovim Config]]
	vim.keymap.set("n", "<leader>nr", function()
		for name, _ in pairs(package.loaded) do
			if name:match("^plugins") or name:match("^config") then
				package.loaded[name] = nil
			end
		end
		dofile(vim.env.MYVIMRC)
		vim.notify("Config Reloaded!")
	end, { desc = "[N]eovim [R]eload" })

	-- [[ Format (conform.nvim) ]]
	vim.keymap.set("", "<leader><leader>", function()
		require("conform").format({ async = true, lsp_format = "fallback" })
	end, { desc = "Format buffer" })

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
	vim.keymap.set("n", "<leader>sb", t_builtin.buffers, { desc = "[S]earch [B]uffers" })

	vim.keymap.set("n", "<leader>/", function()
		t_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 5,
			previewer = false,
			layout_config = {
				height = 0.5,
				width = 0.5,
				anchor = "SE",
			},
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

	-- [[ MiniFiles ]]
	vim.keymap.set("n", "<leader>fr", function()
		require("mini.files").open()
	end, { desc = "[F]iles [R]oot explore" })

	vim.keymap.set("n", "<leader>fl", function()
		local buf_path = vim.api.nvim_buf_get_name(0)
		if buf_path ~= "" then
			require("mini.files").open(vim.fn.fnamemodify(buf_path, ":h"))
		else
			require("mini.files").open()
		end
	end, { desc = "[F]iles [L]ocal explore" })

	local show_dotfiles = true

	---@diagnostic disable-next-line: unused-local
	local filter_show = function(fs_entry)
		return true
	end

	local filter_hide = function(fs_entry)
		return not vim.startswith(fs_entry.name, ".")
	end

	local toggle_dotfiles = function()
		show_dotfiles = not show_dotfiles
		local new_filter = show_dotfiles and filter_show or filter_hide
		MiniFiles.refresh({ content = { filter = new_filter } })
	end

	local set_cwd = function()
		local path = (MiniFiles.get_fs_entry() or {}).path
		if path == nil then
			return vim.notify("Cursor is not on valid entry")
		end
		vim.fn.chdir(vim.fs.dirname(path))
	end

	local yank_path = function()
		local path = (MiniFiles.get_fs_entry() or {}).path
		if path == nil then
			return vim.notify("Cursor is not on valid entry")
		end
		vim.fn.setreg(vim.v.register, path)
	end

	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniFilesBufferCreate",
		callback = function(args)
			local buf_id = args.data.buf_id

			-- Toggle dotfiles visibility with `t.`
			vim.keymap.set("n", "t.", toggle_dotfiles, { buffer = buf_id })

			-- mappings = { synchronize = "<C-s>" },
			vim.keymap.set("n", "<C-s>", function()
				require("mini.files").synchronize()
			end, { desc = "Sychronize changes" })

			-- Close on esc
			vim.keymap.set("n", "<esc>", function()
				require("mini.files").close()
			end, { desc = "Close MiniFiles" })

			vim.keymap.set("n", "g~", set_cwd, { buffer = buf_id, desc = "Set cwd" })
			vim.keymap.set("n", "gy", yank_path, { buffer = buf_id, desc = "Yank path" })
		end,
	})
end

return M
