vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- recommendation is to not set these and use filetype indentation instead
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false

-- ignorecase w/ smartcase uses case-sensitivity for searches if uppercase is included in search
-- ignores case if only lowercase
-- ignorecase also affects substitutions, so turn off with :set noignorecase as needed
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 750

vim.opt.colorcolumn = "95"
