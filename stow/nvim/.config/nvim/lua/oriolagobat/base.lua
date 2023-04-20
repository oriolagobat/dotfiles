-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Don't hilight results of previous search
vim.opt.hlsearch = false

-- Wrap
-- Make long lines always visible
vim.opt.wrap = true
-- Preserve indentation on virtual lines
vim.opt.breakindent = true

-- Tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- Tansform tab characters to spacs
vim.opt.expandtab = true

-- System wide clipboard
vim.o.clipboard = unnamedplus

-- Themes
vim.o.termguicolors = true
