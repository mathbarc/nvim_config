return {

    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = {
                        -- '.git',
                        -- '.DS_Store',
                        -- 'thumbs.db',
                    },
                    never_show = {},
                },
                bind_to_cwd = true,
            },
        },
        window = {
            position = "left",
            width = 30,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
            auto_focus = false, -- <--- keep focus on text window
        },
        buffers = {
            follow_current_file = true,
        },
    },
}
