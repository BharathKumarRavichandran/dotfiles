return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "mason-org/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls",
                    "clangd",
                    "cssls",
                    "gopls",
                    "html",
                    "jsonls",
                    "lua_ls",
                    "pyright",
                    "ruff",
                    "ts_ls",
                    "yamlls",
                },
            })

            -- rust-analyzer comes from rustup so it matches the toolchain
            vim.lsp.enable("rust_analyzer")

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            })

            vim.diagnostic.config({
                virtual_text = true,
                severity_sort = true,
                float = { border = "rounded" },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("dotfiles-lsp", { clear = true }),
                callback = function(args)
                    local map = function(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
                    end

                    map("gd", "<cmd>Telescope lsp_definitions<CR>", "Go to definition")
                    map("gr", "<cmd>Telescope lsp_references<CR>", "References")
                    map("gi", "<cmd>Telescope lsp_implementations<CR>", "Implementations")
                    map("gD", vim.lsp.buf.declaration, "Go to declaration")
                    map("K", vim.lsp.buf.hover, "Hover docs")
                    map("<leader>cr", vim.lsp.buf.rename, "Rename")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                end,
            })
        end,
    },
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        version = "*",
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = {
            keymap = { preset = "default" },
            appearance = { nerd_font_variant = "mono" },
            sources = { default = { "lsp", "path", "snippets", "buffer" } },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = "ConformInfo",
        keys = {
            {
                "<leader>cf",
                function()
                    require("conform").format({ async = true })
                end,
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                c = { "clang-format" },
                cpp = { "clang-format" },
                css = { "prettier" },
                go = { "goimports", "gofumpt" },
                html = { "prettier" },
                javascript = { "prettier" },
                json = { "prettier" },
                lua = { "stylua" },
                markdown = { "prettier" },
                python = { "ruff_format" },
                rust = { "rustfmt" },
                sh = { "shfmt" },
                typescript = { "prettier" },
                yaml = { "prettier" },
            },
            format_on_save = { timeout_ms = 3000, lsp_format = "fallback" },
        },
    },
}
