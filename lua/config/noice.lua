require("noice").setup({
    lsp = {
        override = {
            ['vim.lsp.handlers["textDocument/hover"]'] = false,
            ['vim.lsp.handlers["textDocument/signatureHelp"]'] = false,
        },
        progress = {
            enabled = false,
        },
    },
    routes = {
        {
            filter = {
                event = "lsp",
                kind = "progress",
            },
            opts = { skip = true },
        },
    },
})
