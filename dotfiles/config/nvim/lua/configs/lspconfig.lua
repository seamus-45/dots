-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local configs = require "nvchad.configs.lspconfig"

local servers = {
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            maxLineLength = 120,
          }
        }
      }
    }
  },
  ansiblels = {},
  bashls = {},
  yamlls = {},
  taplo = {},
  cssls = {},
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  lspconfig[name].setup(opts)
end
