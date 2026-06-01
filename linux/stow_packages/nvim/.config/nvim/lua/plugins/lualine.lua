return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
        local function lsp_clients()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then
                return ""
            end

            local names = {}
            for _, client in ipairs(clients) do
                table.insert(names, client.name)
            end

            return table.concat(names, ", ")
        end

        return {
            options = {
                globalstatus = true,
                section_separators = "",
                component_separators = { left = "|", right = "|" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff" },
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                    },
                },
                lualine_x = {
                    "diagnostics",
                    {
                        lsp_clients,
                        icon = "",
                        cond = function()
                            return #vim.lsp.get_clients({ bufnr = 0 }) > 0
                        end,
                    },
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        }
    end,
}
