local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- keep the cursor centred while jumping around
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- buffers
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- splits
map("n", "<leader>-", "<cmd>split<CR>", { desc = "Split below" })
map("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Split right" })

-- move selection
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "<", "<gv")
map("v", ">", ">gv")

-- diagnostics
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
