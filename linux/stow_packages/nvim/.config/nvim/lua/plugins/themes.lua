return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
            flavour = "mocha",
            -- compile = {
            --     enabled = true,
            --     path = vim.fn.stdpath("state") .. "/catppuccin", -- Saves compiled bytecode to standard state dir
            -- },
            custom_highlights = function(colors)
                return {
                    DiagnosticError = { fg = colors.red },
                    DiagnosticSignError = { fg = colors.red },

                    DiagnosticWarn = { fg = colors.peach },
                    DiagnosticSignWarn = { fg = colors.peach },

                    DiagnosticInfo = { fg = colors.yellow },
                    DiagnosticSignInfo = { fg = colors.yellow },

                    DiagnosticHint = { fg = colors.lavender },
                    DiagnosticSignHint = { fg = colors.lavender },
                }
            end,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    { "folke/tokyonight.nvim", lazy = true },
    { "Mofiqul/dracula.nvim", lazy = true },
    { "Mofiqul/vscode.nvim", lazy = true },
    { "olimorris/onedarkpro.nvim", lazy = true },
}
