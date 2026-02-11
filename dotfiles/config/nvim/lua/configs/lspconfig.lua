-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

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
  bitbake_ls = {},
  yamlls = {},
  jsonls = {},
  taplo = {},
  cssls = {},
  ts_ls = {},
  termux_language_server = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
