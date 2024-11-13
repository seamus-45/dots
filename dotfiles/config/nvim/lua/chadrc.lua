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
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "arrow",
  },
}

-- M.nvdash = {
--   load_on_startup = true,
-- }
--
return M
