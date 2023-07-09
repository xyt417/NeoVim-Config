require("core.options")
require("core.keymaps")
require("plugins.plugins-setup")
-- 插件
require("plugins.lualine") -- 底部状态栏
require("plugins/nvim-tree") -- 文件树
require("plugins/treesitter") -- 
require("plugins/lsp") -- LSP
require("plugins/cmp") -- 自动补全
require("plugins/comment") -- 快捷注释
require("plugins/autopairs") -- 括号匹配

require("plugins/bufferline") -- 顶部buffer栏
require("plugins/gitsigns") -- 左侧git提示

require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- Example keybindings
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
