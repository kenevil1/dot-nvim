local telescope = require('telescope').setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

require("telescope").load_extension "file_browser"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>pp', vim.cmd.LazyGit, {})

--vim.keymap.set( "n", "<leader>n", "<cmd>Telescope file_browser<CR>", { noremap = true })

vim.keymap.set( "n", "<leader>pv", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
