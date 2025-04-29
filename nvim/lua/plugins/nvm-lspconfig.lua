return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities(),

    lspconfig.pyright.setup({ capabilities = capabilities })
    lspconfig.gopls.setup({ capabilities = capabilities })
    lspconfig.clangd.setup({ capabilities = capabilities })
  end,
}

