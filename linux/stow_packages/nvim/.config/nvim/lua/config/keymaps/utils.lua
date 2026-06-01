--[[ Utils ]]

map = vim.keymap.set

map("n", "<leader>UR", function()
    for name, _ in pairs(package.loaded) do
        if name:match("^plugins") or name:match("^config") then
            package.loaded[name] = nil
        end
    end
    dofile(vim.env.MYVIMRC)
    vim.notify("Config Reloaded!")
end, { desc = "Reload" })

map("n", "<leader>UL", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>UM", "<cmd>Mason<cr>", { desc = "Mason" })

map("n", "<leader>UC", function()
    Snacks.picker.colorschemes()
end, { desc = "ColorSchemes" })
