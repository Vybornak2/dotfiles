local modules = {
	"config.keymaps.general",
	"config.keymaps.codecompanion",
	"config.keymaps.lsp",
	"config.keymaps.snacks",
	"config.keymaps.iron",
	"config.keymaps.copilot",
	"config.keymaps.persistence",
	"config.keymaps.git",
}

for _, name in ipairs(modules) do
	local ok, module = pcall(require, name)
	if not ok then
		vim.notify("Error loading " .. name .. ": " .. module, vim.log.levels.ERROR)
	end
end
