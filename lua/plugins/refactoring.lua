return {
    {
        "ThePrimeagen/refactoring.nvim",
        branch = "master", -- Ensure you aren't on an old feature branch
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {},
        config = function(_, opts)
            require("refactoring").setup(opts)
        end,
    },
}
