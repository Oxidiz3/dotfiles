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
    "folke/which-key.nvim", lazy = false
  },
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
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
}
