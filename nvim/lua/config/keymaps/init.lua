local modules = {
    "config.keymaps.general",
    "config.keymaps.codecompanion",
    "config.keymaps.copilot",
    "config.keymaps.git",
    "config.keymaps.lsp",
    "config.keymaps.persistence",
    "config.keymaps.snacks",
}

for _, name in ipairs(modules) do
    local ok, module = pcall(require, name)
    if not ok then
        vim.notify("Error loading " .. name .. ": " .. module, vim.log.levels.ERROR)
    end
end
