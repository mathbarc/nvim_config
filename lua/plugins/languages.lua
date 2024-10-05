return {

    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "vim",
                "yaml",
                "c",
                "cpp",
                "java",
                "kotlin",
            },
        },
    },

    -- add pyright to lspconfig
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {},
                lua_ls = {},
                clangd = {},
                dockerls = {},
                docker_compose_language_service = {},
                yamlls = {},
                texlab = {},
                jsonls = {},
                opencl_ls = {},
                helm_ls = {},
                jdtls = {},
                kotlin_language_server = {},
                taplo = {}
            },
        },
    },

    { "Civitasv/cmake-tools.nvim" },

    {
        "jpfender/pipenv.nvim",
        requires = "nvim-lua/plenary.nvim",
    },
}
