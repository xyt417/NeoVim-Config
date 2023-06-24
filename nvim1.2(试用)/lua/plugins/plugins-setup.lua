-- 自动安装设置packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成PackerSync
-- plugins.lua改成了plugins-setup.lua
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])
return require('packer').startup(function(use)
-- 添加插件:
  use 'wbthomason/packer.nvim' -- packer
  use 'folke/tokyonight.nvim' -- tokyo 主题(在option中启用)
  use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true} -- 状态栏图标
  }
  use {
      'nvim-tree/nvim-tree.lua', -- 文档树
      requires = {
          'nvim-tree/nvim-web-devicons', -- 文档树图标
      }
  }
  use "nvim-treesitter/nvim-treesitter" -- 语法高亮
  use "p00f/nvim-ts-rainbow" -- 配合treesitter,括号颜色区分
  -- Mason 管理 LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", -- 相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
  }
  -- 自动补全
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("L3MON4D3/LuaSnip") -- snippets引擎，不装自动补全会出问题？
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")
  use("hrsh7th/cmp-path") -- 文件路径
  -- 其它必要插件
  use "numToStr/Comment.nvim" -- gcc和gc快捷注释
  use "windwp/nvim-autopairs" -- 自动补全括号

  use "akinsho/bufferline.nvim" -- buffer栏
  use "lewis6991/gitsigns.nvim" -- 左侧git提示

  use "numToStr/FTerm.nvim" -- 终端

  use('neovim/nvim-lspconfig') -- prettier
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  if packer_bootstrap then
    require('packer').sync()
  end
end)
