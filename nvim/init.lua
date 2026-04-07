-- vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

local require_mod = function(module)
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
