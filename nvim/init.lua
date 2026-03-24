-- python provider (must be first)
local venv_path = vim.fn.expand("~/.local/share/nvim/venv_py/bin")
vim.env.PATH = venv_path .. ":" .. vim.env.PATH
vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/venv_py/bin/python")
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

-- Leader must be set before plugins load
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local modules = { "options", "autocmd", "lazy", "keymaps" }

for _, name in ipairs(modules) do
	local module = require("config." .. name)
	local ok, err = pcall(module.setup)
	if not ok then
		vim.notify("Error running " .. name .. ".setup: " .. err, vim.log.levels.ERROR)
	end
end
