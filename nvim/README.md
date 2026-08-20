# neovim
Run `./configure.sh nvim` from the repo root to symlink this directory to
`~/.config/nvim`. Requires neovim 0.12+ (nvim-treesitter's `main` branch).

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim), which
bootstraps itself on first launch. `:Lazy` manages plugins, `lazy-lock.json`
pins their versions. Language servers install themselves on first use; the
formatters (`stylua`, `prettier`, `shfmt`, `clang-format`, `gofumpt`) are
installed from `:Mason`. `rust-analyzer` is not one of them: it comes from
`rustup component add rust-analyzer`, so it matches the active toolchain.

Leader is `<space>`. Press it and wait for which-key to list what is available.

| key          | action                    |
| ------------ | ------------------------- |
| `<leader>e`  | file explorer             |
| `<leader>ff` | find files                |
| `<leader>fg` | grep                      |
| `<leader>fb` | buffers                   |
| `<leader>gg` | git status (fugitive)     |
| `gd` / `gr`  | definition / references   |
| `K`          | hover docs                |
| `<leader>ca` | code action               |
| `<leader>cr` | rename                    |
| `<leader>cf` | format buffer             |
| `<S-h>/<S-l>`| previous / next buffer    |
| `<C-h/j/k/l>`| move between splits and tmux panes |

Files are formatted on save by [conform.nvim](https://github.com/stevearc/conform.nvim),
falling back to the language server when no formatter is configured.
