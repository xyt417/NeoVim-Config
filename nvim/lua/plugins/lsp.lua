require("mason").setup({
    ui = {
        icons = {
            package_installed = "勾",
            package_pending = "→",
            package_uninstalled = "×",
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",  -- sumneko_lua 安装失败
    },
})

-- lsp 和 自动补全 相结合
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup { -- 换成了lua_ls
  capabilities = capabilities,
}
