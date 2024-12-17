return {
  "lewis6991/gitsigns.nvim",
  init = function()
    local gitsigns = require('gitsigns')
    vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
  end,
}
