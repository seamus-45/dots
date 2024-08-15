require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Unmap some default bindings
nomap("n", "<C-s>")

-- Save on F2
map("n", "<F2>", "<cmd>w<cr>", { desc = "File save" })
-- Enter cmd mode on ;
map("n", ";", ":", { desc = "CMD enter command mode" })
-- Show/Hide tab's and eol's
map("n", "<leader>l", "<cmd>set list!<cr>", { desc = "Toggle tab's and eol's" })
-- Toggle paste mode
map("n", "<leader>p", "<cmd>set paste!<cr>", { desc = "Toggle paste mode" })
-- Toggle panic mode
map("n", "<F9>", "mzggg?G`z", { desc = "Toggle panic mode" })
-- Smart ident blocks
map("v", "<", "<gv", { desc = "Ident block left" })
map("v", ">", ">gv", { desc = "Ident block right" })
-- Smart in line moving
map("n", "H", "^", { desc = "SmartMove Goto begin" })
map("n", "L", "$", { desc = "SmartMove Goto end" })
map("v", "L", "g_", { desc = "SmartMove Mark to end" })
map("i", "<m-l>", "<c-o>l", { desc = "SmartMove Goto forward" })
map("i", "<m-h>", "<c-o>h", { desc = "SmartMove Goto backward" })
map("i", "<m-H>", "<c-o>I", { desc = "SmartMove Goto begin" })
map("i", "<m-L>", "<c-o>A", { desc = "SmartMove Goto end" })

-- NvCheatsheet
map("n", "<F1>", "<cmd>NvCheatsheet<cr>")

-- Nvim-Cmp
map("i", "<C-j>", function()
  require("cmp").select_next_item()
end)
map("i", "<C-k>", function()
  require("cmp").select_prev_item()
end)

-- UndoTree
map("n", "<F4>", function()
  require("undotree").toggle()
end, { desc = "Toggle UndoTree"})

-- Tabufline
map("n", "gj", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "gk", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
