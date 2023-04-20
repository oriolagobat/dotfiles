require('material').setup({
    lualine_style = 'default'
})

vim.g.material_style = "palenight"
vim.cmd 'colorscheme material'
-- Transparent background
-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
-- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
