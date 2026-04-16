vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_win_position = "right"
vim.g.db_ui_winwidth = 40

local dbui_group = vim.api.nvim_create_augroup("DadbodUIProtect", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = dbui_group,
    pattern = "dbui",
    callback = function()
        local win = vim.api.nvim_get_current_win()
        vim.w[win].is_dbui = true
        vim.bo.buflisted = false
    end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = dbui_group,
    callback = function(args)
        local win = vim.api.nvim_get_current_win()
        local buf = args.buf

        if vim.w[win].is_dbui and vim.bo[buf].filetype ~= "dbui" then
            vim.schedule(function()
                vim.cmd("wincmd p")
                vim.cmd("buffer " .. buf)
                vim.cmd("DBUI")
                vim.cmd("wincmd w")
            end)
        end
    end,
})
