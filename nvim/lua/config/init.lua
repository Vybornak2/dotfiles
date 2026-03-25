local modules = { "options", "autocmd", "lazy", "keymaps" }

local M = {}

function M.setup()
	for _, name in ipairs(modules) do
		local ok, module = pcall(require, "config." .. name)
		if ok and module and type(module.setup) == "function" then
			local ok2, err = pcall(module.setup)
			if not ok2 then
				vim.notify("Error running " .. name .. ".setup: " .. err, vim.log.levels.ERROR)
			end
		else
			vim.notify("Error loading " .. name, vim.log.levels.ERROR)
		end
	end
end

return M
