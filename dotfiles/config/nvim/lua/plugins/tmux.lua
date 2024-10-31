return {
  'alexghergh/nvim-tmux-navigation',
    cmd = {
      "NvimTmuxNavigateLeft",
      "NvimTmuxNavigateUp",
      "NvimTmuxNavigateRight",
      "NvimTmuxNavigateDown"
    },
    config = function()
      require("nvim-tmux-navigation").setup {
        disable_when_zoomed = false,
        keybinginds = {
        }
      }
    end,
}
