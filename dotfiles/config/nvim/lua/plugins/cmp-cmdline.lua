return {
  "hrsh7th/cmp-cmdline",
  event = "CmdlineEnter",
  config = function()
    local cmp = require "cmp"

    cmp.setup.cmdline({ "/", "?" }, {
      sources = { { name = "buffer" } },
    })

    cmp.setup.cmdline(":", {
      sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
      enabled = function()
        -- Set of commands where cmp will be disabled
        local disabled = {
          q = true,
          wq = true,
        }
        -- Get first word of cmdline
        local cmd = vim.fn.getcmdline():match "%S+"
        -- Return true if cmd isn't disabled
        -- else call/return cmp.close(), which returns false
        return not disabled[cmd] or cmp.close()
      end,
    })
  end,
}
