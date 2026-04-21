return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
            flavour = "mocha",
            -- compile = {
            --     enabled = true,
            --     path = vim.fn.stdpath("state") .. "/catppuccin", -- Saves compiled bytecode to standard state dir
            -- },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme "catppuccin"
        end,
    },
    { "folke/tokyonight.nvim", priority = 1000 },
    { "Mofiqul/dracula.nvim",  priority = 1000 },
    { "Mofiqul/vscode.nvim",    priority = 1000 },
}
