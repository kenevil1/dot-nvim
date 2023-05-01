-- ngl a lot of the rebinds here are borrowed from primeagen

-- basically i do everything with spacebar
vim.g.mapleader = " "
-- super common, lets me navigate file system
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- pretty sick rebind
-- basically lets you move entire highlighted text with J and K, auto indents as well
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- moves line below to the end of current line without moving cursor
vim.keymap.set("n", "J", "mzJ`z")
-- remaps the half page jumping to recentre to centre of screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keeps search terms in centre of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
-- avoid situation where you lose current copy buffer when highlighting and pasting
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- just has binds for copy and paste for system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- keeps search terms in centre of screen
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- unbind Q cause fuck Q
vim.keymap.set("n", "Q", "<nop>")

-- quickfix related commands
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- changes all instances of selected word in document
vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
