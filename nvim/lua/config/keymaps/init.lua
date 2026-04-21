local modules = {
    "config.keymaps.ai",
    "config.keymaps.buffers",
    "config.keymaps.code",
    "config.keymaps.general",
    "config.keymaps.git",
    "config.keymaps.lsp",
    "config.keymaps.quit_session",
    "config.keymaps.search",
    "config.keymaps.tabs",
    "config.keymaps.windows",
}

for _, name in ipairs(modules) do
    local ok, module = pcall(require, name)
    if not ok then
        vim.notify("Error loading " .. name .. ": " .. module, vim.log.levels.ERROR)
    end
end
