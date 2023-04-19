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

-- Remap <Leader>fs as write file
map("n", "<Leader>fs", ":wq<CR>")

-- Remap <Leader>fd as discard file
map("n", "<Leader>fd", ":qa!<CR>")
