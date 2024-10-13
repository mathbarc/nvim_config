return {
    -- change trouble config
    {
        "folke/trouble.nvim",
        -- opts will be merged with the parent spec
        opts = { use_diagnostic_signs = true },
    },
    {
        "mfussenegger/nvim-dap"
    },
    {
        'stevearc/overseer.nvim',
        opts = {},
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },
    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        version = '2.*',
    }
}
