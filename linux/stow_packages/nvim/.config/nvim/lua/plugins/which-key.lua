return {
    -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VeryLazy",
    ---@module 'which-key'
    ---@type wk.Opts
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        -- delay between pressing a key and opening which-key (milliseconds)
        delay = 100,
        icons = { mappings = vim.g.have_nerd_font },
        preset = "helix",

        -- Document existing key chains
        spec = {

            { "<leader>a", group = "AI", mode = { "n", "v" }, icon = "🧠" },
            { "<leader>ac", group = "CLI", mode = { "n", "v" } },
            { "<leader><tab>", group = "Tabs", mode = { "n", "v" } },
            { "<leader>b", group = "Buffers", mode = { "n", "v" } },
            { "<leader>c", group = "Code", mode = { "n", "v" } },
            { "<leader>g", group = "Git", mode = { "n", "v" } },
            { "<leader>s", group = "Search", mode = { "n", "v" } },
            { "<leader>q", group = "Quit/Session", mode = { "n" } },
            { "<leader>u", group = "UI", mode = { "n" } },
            { "<leader>U", group = "Utils", mode = { "n" }, icon = "⚙️" },
            { "<leader>w", group = "Windows", mode = { "n" } },

            { "gr", group = "LSP Actions", mode = { "n" } },
        },
    },
}
