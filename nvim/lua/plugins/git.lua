return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            on_attach = function(buffer)
                local gs = require("gitsigns")
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
                end

                map("n", "]h", gs.next_hunk, "Next hunk")
                map("n", "[h", gs.prev_hunk, "Previous hunk")
                map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
                map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
                map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
                map("n", "<leader>gb", function()
                    gs.blame_line({ full = true })
                end, "Blame line")
            end,
        },
    },
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git", "Gdiffsplit", "Gwrite", "GBrowse" },
        dependencies = { "tpope/vim-rhubarb" },
        keys = {
            { "<leader>gg", "<cmd>Git<CR>", desc = "Git status" },
            { "<leader>go", "<cmd>GBrowse<CR>", desc = "Open line on GitHub", mode = { "n", "v" } },
        },
    },
}
