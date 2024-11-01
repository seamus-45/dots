return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter"
  },

  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
  },

  {
    "nvchad/minty",
    cmd = {"Shades", "Huefy"},
  },
  {
    "OXY2DEV/markview.nvim",
    -- Recommended:
    --lazy = false,
    -- If you decide to lazy-load anyway
    ft = "markdown",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function ()
      require("markview").setup()
    end,
  },
}
