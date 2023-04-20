-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Don't hilight results of previous search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Wrap
-- Make long lines always visible
vim.opt.wrap = true
-- Preserve indentation on virtual lines
vim.opt.breakindent = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- Tansform tab characters to spacs
vim.opt.expandtab = true
vim.opt.smartindent = true

-- System wide clipboard
vim.o.clipboard = unnamedplus

-- Colors
vim.o.termguicolors = true
vim.opt.colorcolumn = "80" -- This is what draws the column on the right. Do I like it?

-- Margins
vim.opt.scrolloff = 8

-- Update time
vim.opt.updatetime = 50
