-- See `:help vim.o` and `:help lua-options`

vim.g.have_nerd_font = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.o.number = true
-- vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.foldenable = false

-- Sync clipboard between OS and Neovim (scheduled to avoid increasing startup-time)
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Wayland clipboard provider
vim.g.clipboard = {
	name = "wl-clipboard",
	copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
	paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
	cache_enabled = 1,
}