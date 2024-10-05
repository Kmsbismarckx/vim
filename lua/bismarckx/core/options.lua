vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentations
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
-- opt.cursorline = true

-- backspace
opt.backspace ="indent,eol,start"

-- clipboard
opt.clipboard:append('unnamedplus')

-- split windows
opt.splitright = true
