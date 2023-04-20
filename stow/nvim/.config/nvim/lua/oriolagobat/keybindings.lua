vim.g.mapleader = ' '
vim.g.maplocaleader = ' '

-- Remapping function
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- Remap <C-g> to work as ESC
map("i", "<C-g>", "<Esc>")
map("v", "<C-g>", "<Esc>")

-- Remap <Leader>fs as write file and exit
map("n", "<Leader>fs", ":wq<CR>") -- Write file and quit
map("n", "<Leader>fd", ":qa!<CR>") -- Discard file
map("n", "<Leader>fw", ":w<CR>") -- Write file
map("n", "<Leader>fq", ":q<CR>") -- Quit file

-- Move chunks of code when in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Joining lines makes cursor stay in place
map("n", "J", "mzJ`z")

-- When jumping half pages, cursor stays in the middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Search terms stay in the middle when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- With Leader p the current copied text stays on the register
map("x", "<leader>p", [["_dP]])

-- Disable Q
map("n", "Q", "<NOP>")

-- With Leader s replace current word in all file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Leader x chmod's +x current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
