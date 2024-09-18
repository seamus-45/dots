return {
  'alexghergh/nvim-tmux-navigation',
    keys = {
      { "<M-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", desc = "Tmux Navigate left" },
      { "<M-j>", "<Cmd>NvimTmuxNavigateDown<CR>", desc = "Tmux Navigate left" },
      { "<M-k>", "<Cmd>NvimTmuxNavigateUp<CR>", desc = "Tmux Navigate left" },
      { "<M-l>", "<Cmd>NvimTmuxNavigateRight<CR>", desc = "Tmux Navigate left" },
    },
    config = function()
      require("nvim-tmux-navigation").setup {
        disable_when_zoomed = false
      }
    end,
}
