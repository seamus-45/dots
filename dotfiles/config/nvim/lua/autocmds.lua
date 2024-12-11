-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: :h api-autocmd, :h augroup
-- https://neovim.io/doc/user/autocmd.html

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
-- local hl = vim.api.nvim_set_hl              -- Set highlight

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  desc = "Hightlight selection on yank",
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = "500" }
  end,
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
  desc = "Disable auto commenting on new line",
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})

autocmd("BufReadPost", {
  desc = "Restore cursor position on file open",
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

autocmd("FileType", {
  desc = "Set indent options for nginx config",
  pattern = "nginx",
  command = "set noexpandtab ts=8 sts=0 sw=0 list",
})

-- autocmd("CmdlineEnter", {
--   desc = "Set highlight for cmdline commands",
--   callback = function()
--     local get_theme_tb = require("base46").get_theme_tb
--     local colors = get_theme_tb "base_30"
--     hl(0, 'MsgArea', { fg = colors.white })
--   end,
-- })
--
-- autocmd("CmdlineLeave", {
--   desc = "Set highlight for messages",
--   callback = function()
--     local get_theme_tb = require("base46").get_theme_tb
--     local colors = get_theme_tb "base_30"
--     hl(0, 'MsgArea', { fg = colors.light_grey })
--   end,
-- })
