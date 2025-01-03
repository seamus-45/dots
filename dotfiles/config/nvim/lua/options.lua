require "nvchad.options"

-- add yours here!

local o = vim.o

o.cursorlineopt = "both" -- to enable cursorline!

-- style for non printable symbols
o.listchars = "tab:▸ ,eol:¬,extends:❯,precedes:❮,trail:█" -- TextMate style
o.showbreak = "↪"

-- disable sync with system clipboard
o.clipboard = ""

-- number of screen lines to keep above and below the cursor 
o.scrolloff = 5
