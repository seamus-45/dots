-- override nvim-autopairs plugin
return {
  "windwp/nvim-autopairs",
  opts = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    -- setup cmp for autopairs
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- add custom rules
    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'
    local cond = require 'nvim-autopairs.conds'

    local function Rule_M(a1,ins,a2,lang)
      npairs.add_rule(
        Rule(ins, ins, lang)
          :with_pair(function(args) return a1..a2 == args.line:sub(args.col - #a1, args.col + #a2 - 1) end)
          :with_move(cond.none())
          :with_cr(cond.none())
          :with_del(function(args)
            local col = vim.api.nvim_win_get_cursor(0)[2]
            return a1..ins..ins..a2 == args.line:sub(col - #a1 - #ins + 1, col + #ins + #a2) -- insert only works for #ins == 1 anyway
          end)
      )
    end
    npairs.add_rules({
        Rule_M('{','%','}','htmldjango'),
        Rule_M('{%',' ','%}','htmldjango'),
        Rule_M('{','#','}','htmldjango'),
        Rule_M('{#',' ','#}','htmldjango'),
        Rule_M('{',' ','}'),
    })
  end,
}
