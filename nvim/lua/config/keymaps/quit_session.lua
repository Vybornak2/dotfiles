--[[ Quit / Session ]]

---@diagnostic disable-next-line: unused-local, unused-function
local clean_empty_buffers = function()
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_valid(buf.bufnr) and vim.api.nvim_buf_line_count(buf.bufnr) == 1 then
            vim.api.nvim_buf_delete(buf.bufnr, { force = true })
        end
    end
end

vim.keymap.set("n", "<leader>uss", function()
    require("persistence").save()
end, { desc = "Save" })

vim.keymap.set("n", "<leader>usp", function()
    require("persistence").select()
end, { desc = "Pick" })

vim.keymap.set("n", "<leader>usl", function()
    require("persistence").load({ last = true })
end, { desc = "Last load" })

vim.keymap.set("n", "<leader>usL", function()
    require("persistence").load()
end, { desc = "Load for CWD" })

vim.keymap.set("n", "<leader>usx", function()
    require("persistence").stop()
end, { desc = "X Stop Persistence" })

vim.keymap.set("n", "<leader>usr", function()
    require("persistence").start()
end, { desc = "Run" })
