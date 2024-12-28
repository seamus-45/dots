-- Jinja2 templates
vim.filetype.add {
  extension = {
    j2 = "jinja",
    jinja = "jinja",
    jinja2 = "jinja",
  },
}

-- Bitbake layers and recipes
vim.filetype.add {
  extension = {
    bb = "bitbake",
    bbappend = "bitbake",
    bbclass = "bitbake",
  },
  pattern = {
    ['.*/poky/.*/*.conf'] = "bitbake",
    ['.*/poky/.*/*.inc'] = "bitbake",
  }
}
