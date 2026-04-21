--[[ General Keymmaps ]]

-- [[ General keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Arrow key hints ]]
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- [[ Window navigation ]]
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Diagnostics ]]
vim.keymap.set("n", "<leader>td", vim.diagnostic.setloclist, { desc = "Diagnostics" })
vim.keymap.set("n", "L", function()
    vim.diagnostic.open_float({
        scope = "line",
    })
end, { desc = "Line Diagnostics" })

--[[ Neovim ]]
vim.keymap.set("n", "<leader>nr", function()
    for name, _ in pairs(package.loaded) do
        if name:match("^plugins") or name:match("^config") then
            package.loaded[name] = nil
        end
    end
    dofile(vim.env.MYVIMRC)
    vim.notify("Config Reloaded!")
end, { desc = "Reload" })
vim.keymap.set("n", "<leader>nl", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>nm", "<cmd>Mason<cr>", { desc = "Mason" })


--[[ Utils ]]
vim.keymap.set("n", "<leader>ur", function()
    vim.cmd("edit!")
end, { desc = "Reload" })

--[[ Explorer]]
vim.keymap.set("n", "<leader>e", function() Snacks.explorer.open() end, { desc = "Explorer" })
