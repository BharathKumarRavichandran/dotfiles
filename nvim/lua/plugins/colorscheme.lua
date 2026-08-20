return {
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
        config = function()
            require("ayu").setup({
                mirage = false,
                overrides = {
                    LineNr = { fg = "#242830" },
                },
            })
            vim.cmd.colorscheme("ayu-dark")
        end,
    },
}
