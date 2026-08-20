local parsers = {
    "bash",
    "c",
    "cpp",
    "css",
    "diff",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "php",
    "python",
    "query",
    "regex",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            require("nvim-treesitter").install(parsers)

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("dotfiles-treesitter", { clear = true }),
                callback = function(args)
                    if not pcall(vim.treesitter.start, args.buf) then
                        return
                    end
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
