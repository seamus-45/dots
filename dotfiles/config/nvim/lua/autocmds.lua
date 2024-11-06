-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: :h api-autocmd, :h augroup
-- https://neovim.io/doc/user/autocmd.html

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  desc = "Hightlight selection on yank",
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
