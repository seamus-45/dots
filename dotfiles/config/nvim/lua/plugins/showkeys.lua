return {
  {
    "nvchad/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      timeout = -1,
      maxkeys = 5,
      excluded_modes = {},
      -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
      position = "bottom-center",
      keyformat = {
        ["<BS>"] = "󰁮 ",
        ["<CR>"] = "󰘌",
        ["<Space>"] = "󱁐",
        ["<Up>"] = "󰁝",
        ["<Down>"] = "󰁅",
        ["<Left>"] = "󰁍",
        ["<Right>"] = "󰁔",
        ["<PageUp>"] = "Page 󰁝",
        ["<PageDown>"] = "Page 󰁅",
        ["<M>"] = "Alt",
        ["<C>"] = "Ctrl",
      },
    },
  },
}
