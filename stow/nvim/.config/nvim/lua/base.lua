-- Numbers
-- Show numbers on lines
vim.opt.number = true
vim.opt.relativenumber = true

-- Search
-- Ignore case unless the search term has an uppercase
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
-- Max tab occupation
vim.opt.tabstop = 2
-- Tab size
vim.opt.shiftwidth = 2
-- Tansform tab characters to spacs
vim.opt.expandtab = true

-- System wide clipboard
vim.o.clipboard = unnamedplus

-- Themes
vim.o.termguicolors = true
