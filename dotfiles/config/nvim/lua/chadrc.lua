-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "material-darker",
  transparency = false,
  -- theme_toggle = { "onedark", "one_light" },
  -- hl_override = {
  --  Comment = { italic = true },
  --  ["@comment"] = { italic = true },
  -- },
  hl_override = {
    Visual = { bg = "lightbg" },
  },
  hl_add = {
    MsgArea = { fg = "teal" },
  },
  changed_themes = {
    falcon = {
      base_30 = {
        grey_fg = "grey",
      },
    },
  },
}

M.lsp = {
  signature = true,
}

M.term = {
  float = {
    height = 0.8,
    width = 0.8,
    row = 0.1,
    col = 0.1,
  },
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "arrow",
  },
  cmp = {
    style = "default",
  },
}

-- M.nvdash = {
--   load_on_startup = true,
-- }
--
return M
