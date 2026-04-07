return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            sections = {
                { section = "header" },
                { icon = "", title = "Keymaps", section = "keys", padding = 1, indent = 1 },
                { icon = " ", title = "Projects", section = "projects", padding = 1, indent = 1 },
                { icon = " ", title = "Recent Files", section = "recent_files", padding = 1, indent = 1 },
                { section = "startup" },
            },
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = "󰚰 ", key = "g", desc = "Neogit", action = ":Neogit" },
                    { icon = " ", key = "o", desc = "GitHub Repo", action = ":!gh repo view --web" },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        picker = {
            ui_select = true,
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
}
