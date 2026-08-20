local augroup = vim.api.nvim_create_augroup("dotfiles", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
        vim.hl.on_yank()
    end,
})

-- restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(args.buf) then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = { "html", "css", "scss", "javascript", "typescript", "typescriptreact", "json", "yaml", "lua" },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = "make",
    callback = function()
        vim.bo.expandtab = false
    end,
})
