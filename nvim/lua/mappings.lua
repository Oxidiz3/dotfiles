require "nvchad.mappings"

  local map = vim.keymap.set
  function DeleteFromAll(keymap)
    local modes = { "n", "i", "v", "t", "x", "s", "o", "c" }

    for _, mode in ipairs(modes) do
      local ok, err = pcall(vim.keymap.del, mode, keymap)
      if not ok and not err:match("No such mapping") then
        error(err)
      end
    end
  end

  map("i", "jk", "<ESC>", { desc = "Exit insert mode"})

  map("n", "<M-k>", "10k", { desc = "Move up 10 lines"})
  map("n", "<M-j>", "10j", { desc = "Move down 10 lines"})

  map("v", "<M-k>", "10k", { desc = "Move up 10 lines"})
  map("v", "<M-j>", "10j", { desc = "Move down 10 lines"})

  map("n", "<leader>rc", "<cmd>luafile $MYVIMRC<CR>", { desc = "[r]eload [c]onfig" })
  map("n", "<leader>rr","<cmd>%s/\\r//ge<CR>", {desc = "[r]emove carriage [r]eturns"})

  map("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Go to left window" })
  map("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Go to down window" })
  map("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Go to up window" })
  map("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Go to right window" })

  map("n", "<leader>cp", "<cmd>let @+ = expand('%:p')<CR>", { desc = "[C]opy [p]ath to clipboard" })
  map("n", "<leader>od", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "[o]pen [d]iagnostics" })

  -- Also use ]d to go to next diagnostic and [d to go to previous diagnostic. Plus lots of other navigation stuff with [ and ]

  -- I was going to add a bunch of commands for lsp stuff but they're coverd already. :h vim.lsp
  -- - "gra" (Normal and Visual mode) is mapped to |vim.lsp.buf.code_action()|
  -- - "gri" is mapped to |vim.lsp.buf.implementation()|
  -- - "grn" is mapped to |vim.lsp.buf.rename()|
  -- - "grr" is mapped to |vim.lsp.buf.references()|
  -- - "grt" is mapped to |vim.lsp.buf.type_definition()|
  -- - "grx" is mapped to |vim.lsp.codelens.run()|
  -- - "gO" is mapped to |vim.lsp.buf.document_symbol()|
  -- - "K" get's the hover

  -- Also use ]d to go to next diagnostic and [d to go to previous diagnostic. Plus lots of other navigation stuff with [ and ] :h [
