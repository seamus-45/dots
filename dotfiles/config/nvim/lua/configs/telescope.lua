local actions = require "telescope.actions"

local options = {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = {
          actions.move_selection_next,
          type = "action",
          opts = { nowait = true, silent = true },
        },
        ["<C-k>"] = {
          actions.move_selection_previous,
          type = "action",
          opts = { nowait = true, silent = true },
        },
      },
    },
  },
}

return options
