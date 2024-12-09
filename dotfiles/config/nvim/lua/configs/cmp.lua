-- override nvim-cmp plugin
local cmp = require "cmp"
local options = {
  mapping = {
    -- Bind custom keycode defined in alacritty (activated on Ctrl+Return) to accept suggestion
    ["CE"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      { "i", "s", "c" }
    ),
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "rg" },
    {
      name = "buffer",
      -- option = {
      --   get_bufnrs = function()
      --     return vim.api.nvim_list_bufs()
      --   end,
      -- },
    },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

-- return vim.tbl_deep_extend("force", options, require "nvchad.cmp")
return options
