require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            never_show = {},
        },
        use_libuv_file_watcher = true,
        follow_current_file = {
            enabled = true,
        },
        bind_to_cwd = true,
    },
    window = {
        position = "left",
        width = 30,
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            ["<space>"] = "none",
        },
    },
    buffers = {
        follow_current_file = { enabled = true },
    },
})
