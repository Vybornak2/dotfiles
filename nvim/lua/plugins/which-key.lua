return {
    -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VeryLazy",
    ---@module 'which-key'
    ---@type wk.Opts
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        -- delay between pressing a key and opening which-key (milliseconds)
        delay = 0,
        icons = { mappings = vim.g.have_nerd_font },

        -- Document existing key chains
        spec = {
            { "<leader>a", group = "AI", mode = { "n", "v" } },
            { "<leader>ac", group = "CLI", mode = { "n", "v" } },

            { '<leader>b', group = 'Buffer', mode = { 'n', 'v' } },
            { '<leader>bd', group = 'Delete', mode = { 'n', 'v' } },

            { "<leader>c", group = "Code", mode = { "n", "v" } },
            { "<leader>cn", group = "Neogen", mode = { "n", "v" } },

            { "<leader>g", group = "Git", mode = { "n", "v" } },
            { "<leader>n", group = "NeoVim", mode = { "n", "v" } },
            { "<leader>s", group = "Search", mode = { "n", "v" } },
            { "<leader>t", group = "Toggle", mode = { "n" } },

            { "<leader>u", group = "Utils", mode = { "n" } },
            { "<leader>us", group = "Session", mode = { "n" } },

            { "gr", group = "LSP Actions", mode = { "n" } },
        },
    },
}
