vim.env.PATH = vim.fn.expand("~/.local/share/nvim/venv_py/bin") .. ":" .. vim.env.PATH
vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/venv_py/bin/python")
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

require_mod = function(module)
    local ok, result = pcall(require, module)
    if not ok then
        vim.notify("Error loading module: " .. module .. "\n" .. result, vim.log.levels.ERROR)
        return nil
    end
    return result
end

require_mod("config.options")
require_mod("config.lazy")
require_mod("config.keymaps")
require_mod("config.autocmd")
