return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
{
  'alexghergh/nvim-tmux-navigation', config = function()

    local nvim_tmux_nav = require('nvim-tmux-navigation')

    nvim_tmux_nav.setup {
        disable_when_zoomed = true -- defaults to false
    }

    vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
    vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
    vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
    vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
    vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
    vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

end
}
  -- {
  --   "ibhagwan/fzf-lua",
  --   -- optional for icon support
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   -- or if using mini.icons/mini.nvim
  --   -- dependencies = { "nvim-mini/mini.icons" },
  --   ---@module "fzf-lua"
  --   ---@type fzf-lua.Config|{}
  --   ---@diagnostic disable: missing-fields
  --
  --   opts = {},
  --   lazy = false,
  --   ---@diagnostic enable: missing-fields
  --   keys = {
  --     {"<leader>ff", "<cmd>FzfLua files<CR>", mode = "n", { desc = "[f]ind [f]iles" }},
  --     {"<leader>fg", "<cmd>FzfLua live_grep<CR>", mode = "n", { desc = "[f]ind using [g]rep" }},
  --     {"<leader>fb", "<cmd>FzfLua buffers<CR>", mode = "n", { desc = "[f]ind in [b]uffers" }},
  --   }
  -- },
  {
    "folke/which-key.nvim", lazy = false
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
   {
      'smoka7/hop.nvim',
      version = "*",
      opts = {
          keys = 'etovxqpdygfblzhckisuran'
      },
      lazy = false,
      keys = {
        {";;", "<cmd>HopCamelCase<CR>", mode="n", { desc = "Hop Camel Case" }}
      },
    },
}
