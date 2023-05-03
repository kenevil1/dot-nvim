--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
--

require("nvim-tree").setup({
    view = {
        side = "left",
        width = 30,
        adaptive_size = true
    }
})

vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')
