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
    "hrsh7th/nvim-cmp",
    -- event = "InsertEnter",
    opts = require "configs.cmp",
  },

  {
    "lukas-reineke/cmp-rg",
    ft = { "yaml", "yaml.ansible", "jinja" },
  },

  {
    "jiaoshijie/undotree",
    config = true,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    ft = "*",
    config = true,
  },

  {
    "echasnovski/mini.align",
    version = "*",
    ft = "*",
    opts = {
      mappings = {
        start = "ga",
        start_with_preview = "gA",
      },
    },
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
    "HiPhish/jinja.vim",
    ft = { "jinja", "*.jinja" },
  },

  {
    "mfussenegger/nvim-ansible",
    ft = { "yaml" },
  },

}
