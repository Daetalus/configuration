return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            sources = {
                -- Python
                null_ls.builtins.formatting.black.with({
                    extra_args = { "--line-length", "79" },
                }),
                null_ls.builtins.formatting.isort.with({
                    extra_args = { "--profile", "black" },
                }),
                null_ls.builtins.diagnostics.flake8,

                -- Go
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.diagnostics.golangci_lint,

                -- C++
                null_ls.builtins.formatting.clang_format,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("LspFormatting", {}),
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        })
    end,
}
