return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
    },
    init = function()
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_win_position = "right"
        vim.g.db_ui_winwidth = 40
    end,
    config = function()
        -- Identify DBUI windows and protect them
        local dbui_group = vim.api.nvim_create_augroup("DadbodUIProtect", { clear = true })

        -- When DBUI opens, tag the window and jump back to main editor
        vim.api.nvim_create_autocmd("FileType", {
            group = dbui_group,
            pattern = "dbui",
            callback = function()
                local win = vim.api.nvim_get_current_win()
                vim.w[win].is_dbui = true
                vim.bo.buflisted = false
                -- vim.schedule(function()
                --     vim.cmd("wincmd p")
                -- end)
            end,
        })

        -- If anything else ever tries to open in the DBUI window, move it out
        vim.api.nvim_create_autocmd("BufWinEnter", {
            group = dbui_group,
            callback = function(args)
                local win = vim.api.nvim_get_current_win()
                local buf = args.buf

                -- Only run if this window was marked as DBUI
                if vim.w[win].is_dbui and vim.bo[buf].filetype ~= "dbui" then
                    vim.schedule(function()
                        -- Move that buffer into a new split (forcefully)

                        vim.cmd("wincmd p") -- go to main window
                        vim.cmd("buffer " .. buf) -- show the buffer there
                        -- Reopen DBUI in its own window if it got replaced
                        vim.cmd("DBUI")
                        -- Focus back to main
                        vim.cmd("wincmd w")
                    end)
                end
            end,
        })
    end,
}
