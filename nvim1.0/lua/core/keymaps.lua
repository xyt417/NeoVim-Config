local keymap = vim.keymap
-- 快捷打开文件树
keymap.set("n", "m", ":NvimTreeToggle<CR>")

-- 切换buffer栏
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

-- 上下移动行
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
