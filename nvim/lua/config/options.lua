--[[ Options ]]
-- `:help vim.o`, `:help lua-options`

-- Leader must be set before plugins load
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Line numbers and UI
vim.o.number = true
vim.g.have_nerd_font = true

-- vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Editing behavior
vim.o.mouse = "a"
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.confirm = true

-- Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldenable = false

-- Splits and command preview
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = "split"

-- Timing
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Files and persistence
vim.o.undofile = true
vim.opt.swapfile = false

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Session options
vim.opt.sessionoptions:remove("blank")
