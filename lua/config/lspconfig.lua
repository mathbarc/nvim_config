vim.lsp.handlers["$/progress"] = function() end
local lspconfig = require("lspconfig")

lspconfig.ltex_plus.setup({
    handlers = {
        ["$/progress"] = function() end,
    },
})

lspconfig.pyright.setup({
    handlers = {
        ["$/progress"] = function() end,
    },
})
