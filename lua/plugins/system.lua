return {
    {
        "linux-cultist/venv-selector.nvim",
        lazy = true,
        branch = "main", -- This is the regexp branch, use this for the new version
        config = function()
            require("venv-selector").setup({
                settings = {},
            })
        end,
        keys = {
            { "<leader>cv", "", desc = "Python Virtual Environment" },
            { "<leader>cvs", "<cmd>VenvSelect<CR>", desc = "Select venv" },
            {
                "<leader>cvd",
                function()
                    require("venv-selector").deactivate()
                    print("Deactivating Venv")
                end,
                desc = "Deactivate venv",
            },
        },
    },
}
