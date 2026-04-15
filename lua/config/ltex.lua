local lspconfig = require("lspconfig")

lspconfig.ltex.setup({
    handlers = {
        ["$/progress"] = function() end,
    },
})

lspconfig.ltex_plus.setup({
    handlers = {
        ["$/progress"] = function() end,
    },
})
