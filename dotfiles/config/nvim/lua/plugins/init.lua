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
    opts = require "configs.treesitter",
  },

  {
    "jiaoshijie/undotree",
    config = true,
  },

  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "echasnovski/mini.align",
    version = "*",
    opts = {
      mappings = {
        start = "ga",
        start_with_preview = "gA",
      },
    },
    keys = {
      {"ga", mode = { "n", "v" }},
      {"gA", mode = { "n", "v" }},
    },
  },

  {
    "HiPhish/jinja.vim",
    ft = {"jinja","*.jinja"}
  },
}
