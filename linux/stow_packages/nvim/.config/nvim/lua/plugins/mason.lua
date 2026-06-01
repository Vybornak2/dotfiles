local tools = {
    lsp = {
        "basedpyright",
        "rust-analyzer",
        "clangd",
        "lua-language-server",
        "json-lsp",
        "yaml-language-server",
        "bash-language-server",
        "taplo",
        "cmake-language-server",
        "dockerfile-language-server",
    },
    formatters = {
        "ruff",
        "isort",
        "stylua",
        "clang-format",
    },
}

return {
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        ---@module 'mason.settings'
        ---@type MasonSettings
        ---@diagnostic disable-next-line: missing-fields
        opts = {},
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",
        dependencies = { "mason-org/mason.nvim" },
        cmd = {
            "MasonToolsInstall",
            "MasonToolsInstallSync",
            "MasonToolsUpdate",
            "MasonToolsUpdateSync",
            "MasonToolsClean",
        },
        opts = {
            ensure_installed = vim.list_extend(vim.deepcopy(tools.lsp), tools.formatters),
        },
    },
}
