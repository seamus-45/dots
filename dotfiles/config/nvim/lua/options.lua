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

-- neovide specific settings
if vim.g.neovide then
  vim.o.guifont = "DroidSansM Nerd Font:h12"
  -- disable animations
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0.00
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_scroll_animation_length = 0.00
end
