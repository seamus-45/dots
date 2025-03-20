local options = {
  ensure_installed = {
    "bash",
    "diff",
    "dockerfile",
    "hcl",
    "html",
    "http",
    "ini",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "nginx",
    "pem",
    "printf",
    "python",
    "query",
    "regex",
    "ssh_config",
    "sxhkdrc",
    "tmux",
    "vim",
    "vimdoc",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "yaml", "yaml.ansible" },
  },
}

return options
