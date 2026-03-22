vim.cmd("hi clear") -- clears existing highlighting groups to default colors
vim.cmd("syntax reset") -- reinitializes syntax highlighting after clearing
vim.g.colors_name = "mymynyte" -- registers active colorscheme name

require("mymynyte").setup()
