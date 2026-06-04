require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("n", "<M-k>", "10k")
map("n", "<M-j>", "10j")
map("n", "<leader>sc", "<cmd>luafile $MYVIMRC<CR>", { desc = "Reload config"})

-- FZFLua
map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })

map("t", "<C-h>", [[<C-\><C-n><C-w>h]], {desc = "Go to left window" })
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], {desc = "Go to down window" })
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], {desc = "Go to up window" })
map("t", "<C-l>", [[<C-\><C-n><C-w>l]], {desc = "Go to right window" })

-- Hop moving around file 
map("n", ";;", "<cmd>HopCamelCase<CR>", {desc = "Hop Camel Case"})

map("n", "<leader>cp", "<cmd>:let @+ = expand('%')<CR>", {desc = "Copy path to clipboard"})

