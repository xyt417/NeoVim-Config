require("mason").setup({
    ui = {
        icons = {
            package_installed = "勾",
            package_pending = "→",
            package_uninstalled = "_",
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
    on_attach = on_attach,
}

-- clangd
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
    capabilities = capabilities, cmd = { "clangd" },
    on_attach = on_attach,
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = function() return vim.loop.cwd() end,
    single_file_support = true
})
-- python
lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings={
      python = {
      pythonPath="/opt/homebrew/bin/python3"
      },
      pyright = {}
  }
})

-- frontend
local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})

local prettier = require("prettier")
prettier.setup({
    bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
    filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
    root_dir = function() return vim.loop.cwd() end,
})
-- asm
lspconfig["asm_lsp"].setup({
    cmd = { "asm-lsp" },
    filetypes = { "asm", "s", "S" },
})
-- java
lspconfig["jdtls"].setup({
    cmd = { "jdtls" },
    filetypes = { "java" },
    root_dir = function() return vim.loop.cwd() end,
    on_attach = on_attach,
    capabilities = capabilities,
})
