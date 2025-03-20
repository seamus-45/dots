return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = false,
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline",
      format = {
        cmdline = { pattern = "^:", icon = " 󰇙", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = " ", lang = "bash" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = " " },
        lua = false,
      },
    },
    popupmenu = { enabled = true },
    lsp = {
      progress = { enabled = false },
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
  },
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {
      "rcarriga/nvim-notify",
      opts = {
        timeout = 5000,
        render = "minimal",
        top_down = false,
        stages = "fade_in_slide_out",
      },
    },
  },
}
