require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Unmap some default bindings
nomap("n", "<C-s>")
-- Term
nomap({"n", "t"}, "<m-h>")
nomap({"n", "t"}, "<m-v>")
nomap({"n", "t"}, "<m-i>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<F2>", "<cmd>w<cr>", { desc = "File save" })
map("i", "<F2>", "<cmd>w<cr>", { desc = "File save" })
map("n", "<leader>i", "<cmd>IBLToggle<cr>", { desc = "Toggle ident lines" })
map("n", "<leader>l", "<cmd>set list!<cr>", { desc = "Toggle list mode" })
map("n", "<leader>p", "<cmd>set paste!<cr>", { desc = "Toggle paste mode" })
map("n", "<F9>", "mzggg?G`z", { desc = "Toggle panic mode" })
map("n", "<leader>ew", "<cmd>e ++enc=cp1251<cr>", { desc = "Encoding change encoding to 1251" })
map("v", "<", "<gv", { desc = "Ident block left" })
map("v", ">", ">gv", { desc = "Ident block right" })
map("n", "H", "^", { desc = "SmartMove Goto begin" })
map("n", "L", "$", { desc = "SmartMove Goto end" })
map("v", "L", "g_", { desc = "SmartMove Mark to end" })
map("i", "<m-l>", "<c-o>l", { desc = "SmartMove Goto forward" })
map("i", "<m-h>", "<c-o>h", { desc = "SmartMove Goto backward" })
map("i", "<m-H>", "<c-o>I", { desc = "SmartMove Goto begin" })
map("i", "<m-L>", "<c-o>A", { desc = "SmartMove Goto end" })
map("n", "<m-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Tmux Navigate Left" })
map("n", "<m-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Tmux Navigate Down" })
map("n", "<m-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Tmux Navigate Up" })
map("n", "<m-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Tmux Navigate Right" })

-- NvCheatsheet
map("n", "<F1>", "<cmd>NvCheatsheet<cr>")

-- Nvim-Cmp navigation
map("i", "<C-j>", function()
  require("cmp").select_next_item()
end)
map("i", "<C-k>", function()
  require("cmp").select_prev_item()
end)

-- UndoTree
map("n", "<leader><backspace>", function()
  require("undotree").toggle()
end, { desc = "Toggle UndoTree"})

-- Tabufline
map("n", "gj", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "gk", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

-- Term : pos = [sp|vsp|float]
map({ "n", "t" }, "<m-CR>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoddleTerm" }
end, { desc = "Toggle Horizontal Term" })

-- Open color picker
map("n", "<leader>cp", function()
  require("plenary.reload").reload_module "minty.huefy"
  require("minty.huefy").open()
end, { desc = "Toggler color picker (huefy)" })
--
-- Open color picker
map("n", "<leader>cP", function()
  require("plenary.reload").reload_module "minty.shades"
  require("minty.shades").open()
end, { desc = "Toggler color picker (shades)" })

-- Open menu with keyboard
vim.keymap.set("n", "<leader>m", function()
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options)
end, {})

-- Open menu with mouse
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
