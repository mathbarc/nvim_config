-- Global settings (formerly the 'init' function)
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_win_position = "right"
vim.g.db_ui_winwidth = 40

-- Window Protection Logic (formerly the 'config' function)

-- Identify DBUI windows and protect them
local dbui_group = vim.api.nvim_create_augroup("DadbodUIProtect", { clear = true })

-- When DBUI opens, tag the window
vim.api.nvim_create_autocmd("FileType", {
    group = dbui_group,
    pattern = "dbui",
    callback = function()
        local win = vim.api.nvim_get_current_win()
        vim.w[win].is_dbui = true
        vim.bo.buflisted = false
    end,
})

-- If anything else tries to open in the DBUI window, move it out
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = dbui_group,
    callback = function(args)
        local win = vim.api.nvim_get_current_win()
        local buf = args.buf

        -- Only run if this window was marked as DBUI and the new buffer isn't DBUI
        if vim.w[win].is_dbui and vim.bo[buf].filetype ~= "dbui" then
            vim.schedule(function()
                -- Move that buffer into the previous window (main editor)
                vim.cmd("wincmd p")
                vim.cmd("buffer " .. buf)

                -- Reopen DBUI in its designated spot if it was replaced
                vim.cmd("DBUI")

                -- Focus back to main editor
                vim.cmd("wincmd w")
            end)
        end
    end,
})
