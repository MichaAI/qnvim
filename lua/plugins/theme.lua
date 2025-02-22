local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup()
vim.g.catppuccin_flavour = "mocha"
vim.cmd[[colorscheme catppuccin]]

require('lualine').setup()
