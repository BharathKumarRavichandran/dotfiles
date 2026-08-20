local opt = vim.opt

opt.number = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 3
opt.termguicolors = true
opt.mouse = "a"
opt.title = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

opt.splitright = true
opt.splitbelow = true

opt.undofile = true
opt.swapfile = false
opt.updatetime = 250
opt.timeoutlen = 400
opt.confirm = true

opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
