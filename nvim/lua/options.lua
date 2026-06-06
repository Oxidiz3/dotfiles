require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
vim.wo.relativenumber = true
vim.diagnostic.config({
  update_in_insert = false,
})
