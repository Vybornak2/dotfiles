return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
        compile = {
            enabled = true,
            path = vim.fn.stdpath("state") .. "/catppuccin", -- Saves compiled bytecode to standard state dir
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
