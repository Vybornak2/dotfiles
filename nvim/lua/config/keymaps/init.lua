local modules = {
	"config.keymaps.general",
	"config.keymaps.telescope",
	"config.keymaps.codecompanion",
	"config.keymaps.lsp",
	"config.keymaps.snacks",
	"config.keymaps.iron",
	"config.keymaps.copilot",
	"config.keymaps.persistence",
	"config.keymaps.git",
	-- "config.keymaps.markdown-preview",
}

local M = {}

function M.setup()
	for _, name in ipairs(modules) do
		local ok, module = pcall(require, name)
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
