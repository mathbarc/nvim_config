require("noice").setup({
    lsp = {
        override = {
            ['vim.lsp.handlers["textDocument/hover"]'] = false,
            ['vim.lsp.handlers["textDocument/signatureHelp"]'] = false,
        },
        progress = {
            enabled = false, -- Disables the Noice progress bar
        },
    },
    routes = {
        {
            -- Filter out all LSP progress messages
            filter = {
                event = "lsp",
                kind = "progress",
            },
            opts = { skip = true },
        },
    },
})
