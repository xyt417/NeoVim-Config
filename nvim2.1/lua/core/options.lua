vim.opt.number = true
local opt = vim.opt
-- 行号
opt.number = true
-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
-- 自动换行？
opt.wrap = true
-- 系统剪切板
opt.clipboard:append("unnamedplus")
-- 外观(终端真颜色)
opt.termguicolors = true
-- 左侧多一列
opt.signcolumn = "yes"


vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "hard"
vim.cmd[[colorscheme gruvbox]]
vim.cmd[[set background=dark]]

vim.g.copilot_assume_mapped = true

vim.cmd('set cursorline')

vim.cmd('highlight! link Identifier GruvboxFg2')
vim.cmd('highlight! link Operator GruvboxFg0')
vim.cmd('highlight! link Function GruvboxFg0')

