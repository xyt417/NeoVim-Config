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
opt.wrap = ture
-- 系统剪切板
opt.clipboard:append("unnamedplus")
-- 外观(终端真颜色)
opt.termguicolors = true
-- 左侧多一列
opt.signcolumn = "yes"

vim.cmd[[colorscheme tokyonight-moon]]

vim.g.copilot_assume_mapped = true
