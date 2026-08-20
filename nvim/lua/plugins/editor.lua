return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            { "<leader><space>", "<cmd>Telescope find_files<CR>", desc = "Find files" },
            { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep" },
            { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
            { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
            { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
        },
        config = function()
            local fd = vim.fn.executable("fd") == 1 and "fd" or "fdfind"
            require("telescope").setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob=!.git/*",
                    },
                    file_ignore_patterns = { "%.git/", "node_modules/", "__pycache__/" },
                },
                pickers = {
                    find_files = {
                        find_command = { fd, "--type", "f", "--hidden", "--exclude", ".git", "--color", "never" },
                    },
                },
            })
            pcall(require("telescope").load_extension, "fzf")
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "File explorer" },
            { "<leader>fe", "<cmd>Neotree reveal<CR>", desc = "Reveal file in explorer" },
        },
        opts = {
            filesystem = {
                follow_current_file = { enabled = true },
                filtered_items = { hide_dotfiles = false, hide_gitignored = true },
            },
        },
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
        keys = {
            { "<C-h>", "<cmd>TmuxNavigateLeft<CR>" },
            { "<C-j>", "<cmd>TmuxNavigateDown<CR>" },
            { "<C-k>", "<cmd>TmuxNavigateUp<CR>" },
            { "<C-l>", "<cmd>TmuxNavigateRight<CR>" },
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
}
